# Lab 06: Live processes and memory pressure
Pair: Ayanat + Anuarkhan · Date: 15/11/2026 · Guests: Ubuntu version vs Windows edition

## Part 1 — One process, three tools
Process chosen: `python -m http.server 8000` (`python.exe` / `python3`) — why: running the exact same built-in HTTP server module across both OSes provides an identical user-space workload so any differences in memory, hierarchy, and handles come directly from OS kernel design rather than application differences.

| Metric | Windows (Task Manager) | Windows (Process Explorer) | Linux (`htop` & `/proc` / `ps`) |
| :--- | :--- | :--- | :--- |
| **Executable / Command** | `python.exe` | `python.exe -m http.server 8000` | `python3 -m http.server 8000` |
| **PID** | `6776` | `6776` | `1855` |
| **Parent (Name & PID)** | *Not shown in Task Manager* | `python.exe` (`3088`) | `-bash` (`1573`) |
| **Resident / Working Set** | Working set: `25,168 K` (~24.6 MB)<br>Private working set: `13,264 K` (~13.0 MB) | Working Set: `25,168 K`<br>WS Private: `13,264 K` | `RES` (RSS): `22,464 KB` (~21.9 MB)<br>`SHR`: `10,740 KB` (~10.5 MB) |
| **Virtual / Commit** | Commit size: `15,564 K` (~15.2 MB) | Private Bytes: `15,564 K` (~15.2 MB) | `VSZ` (VIRT): `35,404 KB` (~34.6 MB) |
| **Threads** | `1` | `1` | `1` (`NLWP`) |
| **Handles / File Descriptors** | `133` | `133` | `4` (`0, 1, 2 -> /dev/tty1`, `3 -> socket:`) |

### Where the tools disagree
* **Parent-Child Hierarchy & Command Line:** Windows Task Manager (`Details` tab) displays processes as a flat list and hides both `PPID` and full command-line arguments, making it look like two unrelated `python.exe` processes (`3088` and `6776`) are running. Process Explorer (`Ctrl+T`) and `htop` (`F5`) expose the real process tree (`3088` is the Python launcher parent of `6776`; `-bash` `1573` is the parent of `1855`).
* **Committed Memory vs. Virtual Size (`Commit / Private Bytes` vs. `VSZ`):** Windows reports `15,564 K` of committed private bytes (virtual memory explicitly backed by RAM or pagefile), whereas Linux reports `35,404 KB` for `VSZ` because Linux counts all mapped virtual address ranges (including shared libraries and unallocated heap reservations) upfront under its optimistic memory overcommit model.
* **Kernel Object Accounting (`Handles` vs. `File Descriptors`):** Windows reports `133` handles because the Windows Object Manager tracks Registry keys, DLL sections, Events, Mutants, Semaphores, and ALPC ports inside the process handle table, whereas Linux `/proc/1855/fd` shows only `4` file descriptors strictly representing I/O streams (`stdin`/`stdout`/`stderr` on `/dev/tty1` and the listening TCP `socket`).

## Part 2 — Memory pressure
Guest RAM: `1,458 MB` (1.42 GiB) · swap: `2,043 MB` (2.00 GiB)

Steps:
1. `free -m` (record baseline memory and swap)
2. `stress-ng --vm 2 --vm-bytes 5G --vm-keep -t 15s &` (spawn two virtual memory workers requesting 5 GB total to exceed combined RAM + swap)
3. `free -m` and `vmstat 1 3` (capture memory exhaustion and swap thrashing during peak load)
4. `sudo dmesg -T | grep -i -C 5 -E "oom|killed process|out of memory"` (extract OOM Killer decision from kernel ring buffer)
5. `free -m` (verify memory reclamation after OOM termination)

| | Before | During (worst) | After |
| :--- | :--- | :--- | :--- |
| **Available** | `1,126 MB` | `115 MB` | `1,178 MB` |
| **Swap used** | `71 MB` | `989 MB` | `72 MB` |

What happened: Under the 5 GB allocation pressure (`t = 0s` to `~10s`), available RAM dropped from `1,126 MB` to `115 MB` and the terminal briefly froze for a few seconds as `vmstat` swap-out (`so`) spiked to `186,928 KB/s` and CPU I/O wait (`wa`) hit `55%`. At `~10s` into the run (`[Sun Nov 15 18:03:59 2026]`), the kernel invoked the OOM Killer, terminated the worker process with `SIGKILL`, and within `2–3 seconds` terminal responsiveness and available RAM (`1,178 MB`) returned to normal.

### What the kernel did
> `[Sun Nov 15 18:03:59 2026] oom-kill:constraint=CONSTRAINT_NONE,nodemask=(null),cpuset=/,mems_allowed=0,global_oom,task_memcg=/user.slice/user-1000.slice/session-1.scope,task=stress-ng-vm,pid=1965,uid=1000`
> `[Sun Nov 15 18:03:59 2026] Out of memory: Killed process 1965 (stress-ng-vm) total-vm:2673820kB, anon-rss:740032kB, file-rss:544kB, shmem-rss:12kB, UID:1000 pgtables:5224kB oom_score_adj:1000`

When both physical RAM and swap could no longer satisfy page faults (`global_oom`), the Linux kernel evaluated processes by their badness score (`oom_score`). It selected and killed `stress-ng-vm` (PID `1965`) at `18:03:59` because it held the largest anonymous resident footprint (`anon-rss: 740,032 kB`) and had the maximum `oom_score_adj: 1000` priority, immediately reclaiming its memory pages and page tables to protect core system daemons.

### Windows
Command run in PowerShell:
```powershell
Get-WinEvent -FilterHashtable @{LogName='System'; ProviderName='Microsoft-Windows-Resource-Exhaustion-Detector'} -MaxEvents 5
```
Result & explanation: *No events were found (`No events were found that match the specified selection criteria`).* Unlike Linux—which allows optimistic virtual memory overcommit and relies on an aggressive kernel-mode OOM Killer to send `SIGKILL` after exhaustion—Windows enforces strict **commit limits** (`RAM + pagefile`). If applications approach the commit limit, Windows' user-mode Resource Exhaustion Detector (`radardt.dll`) logs Warning/Error events (`Event ID 2004`) from `Microsoft-Windows-Resource-Exhaustion-Detector` and prompts or closes the highest-committing user apps before kernel memory stalls. Because our Windows guest never hit its commit ceiling, zero exhaustion events were logged.

## What did not work the first time
1. Running `stress-ng --vm 2 --vm-bytes 4G --vm-keep -t 30s` on the first attempt completed cleanly without triggering the OOM Killer because 4 GB of sparsely touched virtual allocations fit within the VM's combined `1.42 GiB` RAM, `2.00 GiB` swap, and reclaimed page cache (`buff/cache` dropped from `483 MB` to `159 MB`). Increasing the target allocation to `--vm-bytes 5G` forced true physical exhaustion and triggered the OOM Killer.
2. During peak swap thrashing (`wa = 55%`), typing the measurement command interactively caused a stray keystroke (`ecvhecho: command not found`) because terminal echo lagged behind input; chaining the `stress-ng`, `sleep`, `free -m`, and `vmstat` commands on a single line solved the timing issue cleanly.
