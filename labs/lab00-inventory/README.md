# Lab 0 — Inventory your own machine

Pair:                     Driver first half:
Machine:
Date:

## What I did

enters the needed commands

## Result
/Get-CimInstance Win32_PhysicalMemory | Select-Object Manufacturer,Capacity,Speed

Manufacturer  Capacity    Speed
Samsung       8589934592  5600

/Get-PhysicalDisk | Select-Object FriendlyName,MediaType

FriendlyName              MediaType
SKHynix_HFS256GEM9X169N   SSD

/Get-PSDrive C  # Replace C with your VM storage drive letter


Name           Used (GB)     Free (GB) Provider      Root                               CurrentLocation
C                  28.85        208.52 FileSystem    C:\                                Users\Innotech

/Get-ComputerInfo | Select BiosFirmwareType, BiosVersion, BiosReleaseDate

BiosFirmwareType BiosVersion   BiosReleaseDate
            Uefi LENOVO - 1080 9/22/2025 6:00:00 AM

/Get-CimInstance Win32_Processor | Select Name, VirtualizationFirmwareEnabled, VMMonitorModeExtensions
Name             VirtualizationFirmwareEnabled VMMonitorModeExtensions
Intel(R) N100                            False                   False

## What did not work the first time
nothing
## Evidence
https://raw.githubusercontent.com/yerembessova/ayanat-yerembesova/refs/heads/main/labs/image.png
