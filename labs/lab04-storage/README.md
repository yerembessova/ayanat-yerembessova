# Lab 4 — Partition, mirror, fail, recover

Pair: Ayanat + Anuarkhan · Date: 9/11/2026 · Hypervisor: VirtualBox

## 1. Windows Guest

### Partitioning and Formatting Output
A new 1 GB virtual disk (`lab04-win.vdi`) was attached to the Windows guest, initialized with GPT, partitioned to maximum size, and formatted as NTFS with the label `LAB04` (Drive Letter `E:`).

```powershell
PS C:\Windows\system32> Get-Disk | Select-Object Number, FriendlyName, PartitionStyle, Size

Number FriendlyName   PartitionStyle       Size
------ ------------   --------------       ----
     0 VBOX HARDDISK  GPT            85899345920
     1 VBOX HARDDISK  GPT             1073741824

PS C:\Windows\system32> Get-Volume | Where-Object {$_.FileSystemLabel -eq 'LAB04'}

DriveLetter FriendlyName FileSystemType DriveType HealthStatus OperationalStatus SizeRemaining      Size
----------- ------------ -------------- --------- ------------ ----------------- -------------      ----
E           LAB04        NTFS           Fixed     Healthy      OK                    987.39 MB 1006.98 MB
```

### Question: MBR or GPT — and why?
**GPT (GUID Partition Table)** was chosen over MBR. GPT is the modern standard required for UEFI boot, supports disks larger than 2 TB, allows up to 128 primary partitions, and stores a backup copy of the partition table at the end of the disk along with CRC32 checksums to detect corruption.

---

## 2. Linux Guest (Ubuntu)

### Disks Before (`lsblk`)
Three 1 GB virtual disks (`sdb`, `sdc`, `sdd`) were attached to the Ubuntu guest.

```text
NAME                      SIZE TYPE FSTYPE      MOUNTPOINTS
sda                        25G disk             
├─sda1                      1M part             
├─sda2                      2G part ext4        /boot
└─sda3                     23G part LVM2_member 
  └─ubuntu--vg-ubuntu--lv 11.5G lvm  ext4        /
sdb                         1G disk             
sdc                         1G disk             
sdd                         1G disk             
```

### Disks After RAID 1 Rebuild (`lsblk`)
A RAID 1 array (`/dev/md0`) was built using `sdb1` and `sdc1`, formatted with `ext4` (`mirror`), and mounted at `/mnt/mirror`. After simulating a failure on `sdc1`, the spare partition `sdd1` was added to rebuild the mirror.

```text
NAME                      SIZE TYPE  FSTYPE            MOUNTPOINTS
sda                        25G disk                    
├─sda1                      1M part                    
├─sda2                      2G part  ext4              /boot
└─sda3                     23G part  LVM2_member       
  └─ubuntu--vg-ubuntu--lv 11.5G lvm   ext4              /
sdb                         1G disk                    
└─sdb1                   1022M part  linux_raid_member 
  └─md0                  1021M raid1 ext4              /mnt/mirror
sdc                         1G disk                    
└─sdc1                   1022M part  linux_raid_member 
sdd                         1G disk                    
└─sdd1                   1022M part  linux_raid_member 
  └─md0                  1021M raid1 ext4              /mnt/mirror
```

### Question: Why is RAID not a backup?
**RAID provides availability and hardware fault tolerance, not data protection.** While RAID 1 mirrors data across two disks so the system survives a physical drive failure without downtime, any accidental file deletion, filesystem corruption, ransomware attack, or malicious modification is immediately replicated to all drives in the array. A true backup requires an independent, isolated copy of data stored separately (ideally offline or offsite) with versioning.

---

## 3. Evidence Files
All raw outputs are stored unedited inside the `evidence/` directory:
* `evidence/lsblk-before.txt`
* `evidence/array-healthy.txt`
* `evidence/checksum-before.txt`
* `evidence/array-degraded.txt`
* `evidence/checksum-after-failure.txt`
* `evidence/array-rebuilt.txt`

---

## 4. What Did Not Work the First Time
1. **Windows PowerShell Permissions:** Running disk initialization and partitioning commands in a standard user PowerShell session resulted in a `PermissionDenied` error. Launching PowerShell as Administrator (`C:\Windows\system32>`) resolved the issue.
2. **Linux Terminal Paste Escape Codes & `lsblk` Syntax:** Copying multi-line commands directly from the PDF guide introduced bracketed paste characters (`^[[200~`) and spaces after commas in `lsblk -o NAME, SIZE...`, causing syntax errors. Additionally, trying to run `mdadm --remove` before `mdadm --fail` triggered a `Device or resource busy` error. Running clean single-line commands in the proper order (`--fail` first, then `--remove`) fixed the problem.



## RAID is not a backup
Your colleague deleted the wrong file from the mirror an hour ago. Does RAID 1 help? Why?
<three sentences>

## What did not work the first time
<at least one real thing: what you saw, what it was, what you did>
