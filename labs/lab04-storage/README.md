# Lab 4 — Partition, mirror, fail, recover

Pair: Ayanat + Anuarkhan · Date: 9/11/2026 · Hypervisor: VirtualBox

## Windows

A new 1 GB virtual disk (`lab04-win.vdi`) was attached to the Windows guest, initialized with GPT, partitioned to maximum size, and formatted as NTFS with the label `LAB04` (Drive Letter `E:`).Just so you know, I’ve connected the Ubuntu console to PowerShell to make it easier for me to paste commands. That’s why the documents look the way they do.

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
GPT  was chosen over MBR. It was set to that by default, and the guide said you could choose any one you wanted

---

## Linux — layout before and after

### Before
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

### After
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

## What I did

### 1. Partition and Create RAID 1 Array
```bash
for d in sdb sdc sdd; do
  sudo parted -s /dev/\$d mklabel gpt mkpart primary 1MiB 100% set 1 raid on
done
sudo mdadm --create /dev/md0 --level=1 --raid-devices=2 /dev/sdb1 /dev/sdc1
sudo mkfs.ext4 -L mirror /dev/md0
sudo mkdir -p /mnt/mirror
sudo mount /dev/md0 /mnt/mirror
```

### 2. Simulate Disk Failure
```bash
sudo mdadm /dev/md0 --fail /dev/sdc1
sudo mdadm /dev/md0 --remove /dev/sdc1
```

### 3. Rebuild Array with Spare Disk
```bash
sudo mdadm /dev/md0 --add /dev/sdd1
sudo mdadm --detail --scan | sudo tee -a /etc/mdadm/mdadm.conf
sudo update-initramfs -u
```


## Three states

| State | What /proc/mdstat showed | File |
| --- | --- | --- |
| Healthy | [2/2] [UU] | evidence/array-healthy.txt |
| Degraded | [2/1] [U_] | evidence/array-degraded.txt |
| Rebuilt | [2/2] [UU], sdd1 replaced sdc1 | evidence/array-rebuilt.txt |
Checksums before and after the failure: match

## RAID is not a backup
Your colleague deleted the wrong file from the mirror an hour ago. Does RAID 1 help? Why?
No, RAID 1 does not help in this situation. RAID 1 only protects against physical drive failure by mirroring every disk operation in real time, so the deletion command was immediately replicated to both drives in the array. To recover an accidentally deleted file, you need an independent backup with version history rather than a redundant disk array.

## What did not work the first time
When running `Initialize-Disk` and `New-Partition` in Windows PowerShell, I saw a `PermissionDenied` error. It happened because the terminal was opened as a standard user (`PS C:\Users\Jane>`) without administrative privileges to modify disk partitions. I closed the window, launched PowerShell as Administrator (`C:\Windows\system32>`), and the commands succeeded!

