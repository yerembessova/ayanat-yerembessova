### Build 1 — Accountant
**Load:** 1C:Enterprise, local tax reporting tools (SONO, ESF), multi-sheet Excel workbooks, and 10–15 browser tabs running simultaneously for 8 hours a day.
**Bottleneck:** storage I/O and OS compatibility, not graphics. Large 1C databases and heavy spreadsheets stall on slow drives, and Kazakhstani accounting software requires native Windows.
**Trade-off:** took an Intel Core i3-12100 with DDR4 memory and integrated graphics instead of a Core i5 with DDR5 and a discrete GPU, redirecting the saved ~80,000 KZT into a licensed Windows 11 copy and a reliable 1 TB NVMe SSD. Accounting workloads are mostly single-threaded and do not use 3D acceleration.
**Total:**  KZT (budget.csv, rows 2–11)

### Build 2 — Sales Manager
**Load:** Cloud CRM in Chrome with 30–40 open tabs, Excel price lists, messengers, and four hours of video calls a day, sometimes all at once.
**Bottleneck:** memory, not CPU. Chrome with forty tabs plus an active video call uses around 12–15 GB of RAM; on 16 GB, background tabs reload and the machine starts swapping mid-call.
**Trade-off:** took a Ryzen 5 7600 instead of a Ryzen 7 and skipped a discrete GPU, spending the ~60,000 KZT saved on 32 GB of DDR5 RAM instead of 16 GB. The CPU idles in this role; the memory does not.
**Total:**  KZT (budget.csv, rows 12–21)

### Build 3 — Web Developer
**Load:** IDE (VS Code / JetBrains), 5–8 Docker containers, local PostgreSQL and Redis databases, Node.js build scripts, and 25+ browser tabs for 8–9 hours daily.
**Bottleneck:** CPU multi-core throughput, RAM capacity, and disk IOPS during parallel container builds and database migrations.
**Trade-off:** skipped a discrete GPU and chose Ubuntu 24.04 LTS (open-source GNU GPL license, 0 KZT) instead of paying ~75,000 KZT for Windows, putting that money into an 8-core Ryzen 7 7700, 32 GB DDR5, a fast PCIe 4.0 NVMe SSD, and a 27" 1440p monitor. Web development needs no 3D GPU, and Linux runs Docker natively without WSL2 overhead.
**Total:**  KZT (budget.csv, rows 22–31)

### Build 4 — Designer
**Load:** Adobe Photoshop, Illustrator, Figma, and occasional Premiere Pro video exports with heavy multi-layered 4K assets for 8 hours a day.
**Bottleneck:** GPU acceleration (VRAM and CUDA cores) during canvas rendering and export, plus display color accuracy.
**Trade-off:** chose a 6-core Intel Core i5-14400F instead of a Core i7 and limited storage to a single 1 TB NVMe SSD instead of adding a secondary archive drive, allocating the bulk of the budget to an NVIDIA RTX 4060 8 GB GPU and a 27" 1440p IPS monitor with 100% sRGB coverage. Design tools rely far more on GPU acceleration and color fidelity than on extra CPU cores.
**Total:**  KZT (budget.csv, rows 32–41)
