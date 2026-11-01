# Lab 2 — A Windows guest, and a network between them

Pair:Aynat & Anuarkhan Driver first half: Me
Machine: lenovo windows 11
Date: 1/11/2026

                  [ Internet ]
                       |
        [ Host Laptop: твой IP хост-машины ]
                       |
[ VirtualBox NAT Network • 10.0.2.0/24 ]
         /                           \
        /                             \
[ lab02-ubuntu ]               [ lab02-windows ]
  10.0.2.3                        10.0.2.4


## What I did
1. Downloaded Windows 11 Enterprise evaluation. Licence: [<Evaluation Center link>](https://www.microsoft.com/en-us/evalcenter/download-windows-11-enterprise)
2. Created lab02-windows: 3 vCPU, 4 GB, 64 GB thin, UEFI + Secure Boot, vTPM.
3. Network mode: NAT Network, both guests. Why: To allow communication between VMs and internet through host
4. Ping Ubuntu -> Windows timed out because of Windows Firewall. Fixed with: Netsh/PowerShell firewall rule to allow ICMPv4.
5. Overcommitted: set 10 GB + 10 GB (or 5+5) on a 8 GB host.
## Result
|                       | Before      | After                                                                                                                 |
|-----------------------|-------------|-----------------------------------------------------------------------------------------------------------------------|
| Host RAM in use       |7.0 GB       |I couldn't take measurements because my laptop kept crashing and restarting on its own. It was also lagging very badly.|
| Available             |800-850~ MB  |I couldn't take measurements because my laptop kept crashing and restarting on its own. It was also lagging very badly.|
| Committed / Swap used |11.5/24.9 GB |I couldn't take measurements because my laptop kept crashing and restarting on its own. It was also lagging very badly.|
| What I noticed        |-------------|At first, my cursor started lagging, and then it stopped moving altogether. The screen froze. A window appeared, indicating
|                       |             |a problem. My laptop crashed.

## What did not work the first time
At step 3, I struggled for a long time to get Windows 11 to download properly. I had to enable core isolation and change some PC settings, and I had to recreate the VM over and over again before it finally downloaded!

## Evidence

- [evidence/](evidence/) — one line per file on what it proves
