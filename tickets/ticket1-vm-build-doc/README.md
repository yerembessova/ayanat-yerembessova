# Ticket 1 - New developer starts Monday, needs a test machine

## 1. What was asked
> Hi, we have someone starting on Monday and he needs a test computer set up. Nothing special, just so he can try things without breaking anything. Can you write down how to do it so I can do the next one myself? Thanks

## 2. What was actually needed
The initial ticket request was vague and lacked essential technical specifications. "Nothing special" for a developer means providing the fundamental development ecosystems: a Linux server environment (Ubuntu Server) and a standard Windows testing machine (Windows 11 Enterprise Evaluation). 
"Without breaking anything" implies that the developer's experiments must be completely isolated from the host operating system. To achieve this, a hypervisor is required to manage resources, and system snapshots must be pre-configured so that the office manager can instantly roll back any destructive changes without technical support.

## 3. What I did
1. Installed Oracle VirtualBox as a free, stable, and legally compliant hypervisor suitable for an office environment without purchasing licenses.
2. Downloaded the official Ubuntu Server 25.04 ISO and the Windows 11 Enterprise Evaluation ISO (free for 90 days).
3. Evaluated host machine capacity to allocate resources safely based on my physical **8 GB RAM** host:
   * **Host baseline:** The host Windows OS consumes ~3.5 GB of RAM at idle.
   * **Ubuntu Guest:** Allocated 4096 MB (4 GB) of RAM and 2 CPU cores.
   * **Headroom:** Leaving ~0.5 GB free space dynamically on the host when running. Note: Because of resource constraints on an 8 GB host, the two guests (Linux and Windows) should be run sequentially rather than concurrently to prevent host memory starvation and freezing.
4. Configured thin-provisioned virtual storage (25 GB dynamic disk) to preserve immediate physical drive space.
5. Enabled NAT networking to bypass office network MAC filtering restrictions and guarantee immediate internet access.

| Setting | Default | Mine | Why |
| :--- | :--- | :--- | :--- |
| Disk Type | Fixed Size | Dynamically allocated | Prevents VirtualBox from immediately locking up 25 GB of host space. |
| Network Mode | Bridged | NAT | Hides the guest MAC address behind the host, avoiding corporate network filtering blocks. |

### Resource Calculations
* Total Host RAM: 8 GB (8192 MB)
* Host OS usage: ~3500 MB
* Allocated to Ubuntu Guest: 4000 MB
* Remaining Host Headroom: ~592 MB (Safe for running one VM environment at a time).

## 4. Evidence
* [01-new-vm-wizard.png](evidence/01-new-vm-wizard.png) — Shows the initial VirtualBox setup wizard, selecting Ubuntu (64-bit) base.
* [02-disk-settings.png](evidence/02-disk-settings.png) — Verifies that the virtual storage size is set to 25.00 GB and configured as dynamically allocated.
* [03-network-adapter.png](evidence/03-network-adapter.png) — Proves the virtual network card is bound to the NAT engine for internet access.
* [04-guest-uname.txt](evidence/04-guest-uname.txt) — Unedited command-line output from inside the running Ubuntu system confirming successful kernel initialization.
* [05-ping-between-guests.txt](evidence/05-ping-between-guests.txt) — Text log showing raw ping responses confirming local network loopbacks and external internet resolution.
* [06-snapshot-list.png](evidence/06-snapshot-list.png) — Shows the snapshot tree containing the verified `clean-install` fallback point.

## 5. What I would do differently
If I had to fulfill this ticket again, I would use an Infrastructure-as-Code tool like **Vagrant** combined with **Ansible** scripts instead of configuring the machines manually through a graphical wizard. Manual installation requires clicking through multiple windows, which leaves room for human error if Aigerim mistypes a setting. An automated script would allow her to deploy an identical, pre-configured test environment by running a single command (`vagrant up`) in the terminal.

