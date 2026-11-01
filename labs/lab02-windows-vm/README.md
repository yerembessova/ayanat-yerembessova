# Lab 2 — A Windows guest, and a network between them

Pair:Aynat & Anuarkhan Driver first half: Me
Machine: lenovo windows 11
Date: 1/11/2026

## What I did

I created a separate Windows 11 virtual machine and connected both machines to the same network so they could work together successfully.I used NAT Network because both guests must see each other and the internet, and bridged mode is blocked on campus Wi-Fi. To make this happen, I ran a specific command on the Ubuntu server that allowed the two machines to see each other.
```
<sudo reboot>
```
After that, I needed to find out the address of each machine. I used these commands.
this is for windows

```
<ipconfig>
<ipconfig | Set-Clipboard>
```

and that one for ubuntu
```
<ip -br a>
<ssh -p 2222 nurlanov@127.0.0.1 "ip addr" > labs/lab02-windows-vm/evidence/ip-addr-linux.txt>
```




## Result

## What did not work the first time

At step 3, I struggled for a long time to get Windows 11 to download properly. I had to enable core isolation and change some PC settings, and I had to recreate the VM over and over again before it finally downloaded!

## Evidence

- [evidence/](evidence/) — one line per file on what it proves
