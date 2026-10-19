# Lab 1 — Your first virtual machine

Pair: Ayanat & Anuarkhan   Driver first half: Ayanat
Machine: DESKTOP-R3232AL Intel(R) Core(TM) i5-9300H CPU @ 2.40GHz (2.40 GHz) Lenovo Windows 11, guest Ubuntu Server 26.04.1
Date: <19.10.2026>

## What I did
1. Installed VirtualBox-7.2.20-175154-Win. Licence: https://virtualbox.org
2. Created VM lab01-ubuntu: 2 vCPU, 4 GB RAM, 25 GB dynamic disk, NAT.
3. Installed Ubuntu Server, took snapshot clean-install.
4. Broke it: sudo sed -i 's/dhcp4: true/dhcp4: false/' /etc/netplan/*.yaml
	sudo netplan apply 
5. Rolled back to clean-install: ip -br a
ping -c 3 ubuntu.com 

## Resource justification
I chose 4 GB of RAM and 2 processor cores so that the virtual machine would run stably, while still leaving 4 GB of RAM on my laptop for the host Windows system to use

## Result
The VM boots; the break-and-rollback cycle is shown in the evidence below.

## What did not work the first time
I found it difficult to break the VM, so I chose option B. Also, I got confused about how to take a snapshot

## Evidence
-labs/lab01-first-mv/vm-setting .png -- сPU, memory and disk as configured
- labs/lab01-first-mv/guest-release.txt — Ubuntu Server is running in the guest
- labs/lab01-first-mv/broken.png — the guest in its broken state
- labs/lab01-first-mv/snapshot-list.png— the snapshot, after the rollback
