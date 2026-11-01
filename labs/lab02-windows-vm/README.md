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

I try to ping both ways, but an error occurs. The reason is:Windows Defender Firewall blocks incoming echo requests by default. Ana to fix that need to make Windows accept these pings from Ubuntu by adding a single allow rule.we have to type this command in powershell as admin in our vm windows:
```
<New-NetFirewallRule -DisplayName "Allow ping in (ICMPv4)" -Protocol ICMPv4 -IcmpType 8 -Direction Inbound -Action Allow>
```
After that, I use all these commands to verify. I won’t say where to type what.After that, I use all these commands to verify. I won’t say exactly what to type where, but the full results can be found in the "evidence" folder.
```
<ping ubuntu.com>
<ssh nurlanov@192.168.80.130 "ping -c 4 192.168.80.131; ping -c 4 ubuntu.com" >> labs/lab02-windows-vm/evidence/ping-both-ways.txt>
<ping 10.0.2.3>
```

## Result

## What did not work the first time

At step 3, I struggled for a long time to get Windows 11 to download properly. I had to enable core isolation and change some PC settings, and I had to recreate the VM over and over again before it finally downloaded!

## Evidence

- [evidence/](evidence/) — one line per file on what it proves
