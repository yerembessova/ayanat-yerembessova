# Ticket 2 — Kitting out the new office

## 1. What was asked

> **From:** Daniyar K. (Director)  
> **Subject:** computers for the new office  
>
> We are opening the second office and need four computers — accountant, sales, web developer, designer. Budget 3,000,000 tenge for everything. Everyone says we should just buy the same four machines, is that right? Make sure they last a few years. Monitors included.

## 2. What was actually needed

**Why four identical machines is wrong:**  
Buying four identical PCs wastes budget on hardware that half the team will never use while starving the roles that actually need specific resources. An accountant working in spreadsheets and 1C/accounting software does not need a discrete GPU or 32 GB of high-speed DDR5 RAM, whereas a designer rendering large graphics will hit a severe bottleneck without a dedicated GPU and a high-resolution IPS display. Similarly, a web developer running Docker containers, local databases, and multiple browser instances needs multi-core CPU performance and 32 GB RAM, while a sales manager running 40 browser tabs and video calls simultaneously needs high memory capacity rather than a flagship processor.

**What the request left out:**
* **Peripherals and cabling:** Keyboards, mice, headsets for calls, and network/video cables were not mentioned ("Monitors included", but input devices are required for a working desk).
* **Operating system licensing:** Whether Windows licenses are required for all roles or if open-source Linux (Ubuntu) is acceptable for development.
* **Exact software stack and lifespan:** Specific accounting software versions (e.g., 1C in Kazakhstan), design suites (Adobe Creative Cloud, Figma), and the exact target lifespan ("a few years" usually means 3–5 years of platform viability).
* **Upgradeability expectations:** Whether the company plans to expand RAM or storage later instead of replacing whole units.

**What I would ask Daniyar (if I could):**
1. *Does the company already have volume licenses for Windows and Microsoft Office, or must retail/OEM OS licenses be included inside the 3,000,000 KZT cap?*
2. *Which specific software does the designer use (2D layout like Figma/Photoshop vs. heavy 3D/video rendering), and does the web developer require Windows or can they work on Ubuntu LTS?*
3. *Do the sales manager and accountant need dual-monitor setups or headsets for daily client calls?*

**What I assumed instead:**
* **All-in budget:** The 3,000,000 KZT cap covers everything needed to turn on and use each workstation (PC tower, monitor, keyboard, mouse, headset for sales, and OS licenses).
* **Lifespan (3–5 years):** Every machine must have at least 16 GB RAM (32 GB for heavy multitasking/dev/design) and a 1 TB NVMe PCIe 4.0 SSD so storage and memory do not become obsolete within two years.
* **OS allocation:** Windows 11 Home (licensed) is included for Accountant, Sales Manager, and Designer due to standard office/accounting/creative software requirements in Kazakhstan; Ubuntu 24.04 LTS (free, GNU GPL) is chosen for the Web Developer as it is native for modern web/container stacks.
* **Local procurement:** All prices are sourced in KZT from a Kazakhstan vendor (`shop.kz` / White Wind) as of `2026-11-16`.

## 3. What I did

To stay within the **3,000,000 KZT** cap while meeting every hard requirement (≥ 16 GB RAM, 1 TB SSD, licensed/suitable OS, and monitor per desk), I sized each machine around its primary daily bottleneck rather than splitting the budget equally:

* **Build 1 — Accountant (461,520 KZT):** Focused on reliability, fast boot/file access (1 TB Kingston NV3 NVMe), and a 23.8" IPS screen (`Philips 24E1N3300A`), saving budget on a 4-core `Intel Core i3-12100` with integrated graphics and 16 GB DDR4.
* **Build 2 — Sales Manager (708,900 KZT):** Sized to prevent browser/video-call memory swapping by allocating 32 GB RAM and adding an `A4Tech HU-8` headset for client calls, paired with a 6-core `Ryzen 5 5600X` and 1 TB `MSI Spatium M470 Pro` NVMe.
* **Build 3 — Web Developer (674,800 KZT):** Prioritized multi-core compilation/container performance (`AMD Ryzen 7 7700`, 8 cores on AM5), 32 GB DDR5, a 27" QHD (`2560x1440`) `Xiaomi A27Qi` monitor for code readability, and `Ubuntu 24.04 LTS` (0 KZT), redirecting OS savings into CPU and screen real estate.
* **Build 4 — Designer (901,280 KZT):** Allocated the largest share of the budget to a dedicated GPU (`Palit GeForce RTX 3050 6GB`), 32 GB RAM, 1 TB high-speed NVMe (`MSI Spatium M470 Pro`), and a 27" QHD `Xiaomi A27Qi` display for workspace accuracy.

**Total across all 4 workstations:** **2,746,500 KZT** (leaving **253,500 KZT** under the 3,000,000 KZT cap).  
* Detailed workload reasoning, bottlenecks, and trade-offs: [`builds.md`](./builds.md)  
* Full itemized pricing and vendor links: [`budget.csv`](./budget.csv)

---

### Answers to the Director's Three Questions

**1. Which of the four machines will you upgrade first, eighteen months from now, and why?**  
I will upgrade the **Designer's machine (Build 4)** first, specifically replacing the **GPU (`Palit GeForce RTX 3050 6GB`)** with a higher-tier card (such as an RTX 4060/4070 with 8–12 GB VRAM) and adding a secondary high-capacity SSD. While the 6 GB RTX 3050 handles 2D graphics, UI design, and light photo editing within our initial budget cap, 18 months of growing project file sizes, AI-assisted creative tools, and higher-resolution video/3D assets will saturate its 6 GB framebuffer first.

**2. Price the same four as pre-built machines from a vendor. What does the company gain and what does it lose by not building them?**  
Buying comparable pre-built desktops from a local Kazakhstan vendor (`shop.kz`) plus separate monitors and peripherals costs roughly **2,920,000 – 2,980,000 KZT** in total (e.g., ~490,000 KZT for an office Core i3 system + monitor/OS, ~740,000 KZT for a Ryzen 5 / 32 GB setup, ~730,000 KZT for a Ryzen 7 workstation, and ~980,000 KZT for a Core i5 + RTX 3050/4060 creator PC — see the `Prebuilt` comparison rows in `budget.csv` / table below).  
* **What the company gains:** Single-point turnkey warranty on the entire system unit, zero assembly labor/testing time for IT staff, and immediate out-of-the-box deployment.  
* **What the company loses:** Component-level control (pre-builts often cut corners on no-name PSUs, single-channel RAM, or entry-level motherboards), clean upgrade paths (proprietary cases or locked BIOS), and roughly **170,000–230,000 KZT** in vendor assembly markups.

| Role | Comparable Pre-built PC + Monitor/OS (KZT) | Custom Build Total (KZT) | Difference | Date |
| :--- | :---: | :---: | :---: | :---: |
| Accountant | 495,000 | 461,520 | +33,480 KZT | 2026-11-16 |
| Sales Manager | 745,000 | 708,900 | +36,100 KZT | 2026-11-16 |
| WebDev | 730,000 | 674,800 | +55,200 KZT | 2026-11-16 |
| Designer | 985,000 | 901,280 | +83,720 KZT | 2026-11-16 |
| **Total** | **2,955,000** | **2,746,500** | **+208,500 KZT** | **2026-11-16** |

**3. One of these four people will complain about performance within a month. Which one, and about what?**  
The **Accountant (Build 1)** is the most likely to complain within the first month—not about raw CPU speed, but about **screen size and lack of a numeric keypad / ergonomic workspace**. While the 23.8" `Philips 24E1N3300A` monitor is sharp for standard text, working eight hours a day with wide 1C accounting ledgers and multi-column Excel sheets on a single 1080p 23.8" display forces constant horizontal scrolling compared to the 27" QHD screens given to the developer and designer.

## 4. Evidence

* [`budget.csv`](./budget.csv) — Itemized parts table in UTF-8 with exact KZT prices, `shop.kz` product URLs, role subtotals, and the `2026-11-16` price-check date.
* [`builds.md`](./builds.md) — Detailed breakdown of daily workloads, primary bottlenecks, and budget trade-offs for all four roles.
* [`evidence/pcpartpicker-links.md`](./evidence/pcpartpicker-links.md) — Shareable PCPartPicker build links used to verify estimated wattage, form factors, and component compatibility.
* [`evidence/vendor-quotes/`](./evidence/vendor-quotes/) — Dated screenshots from `shop.kz` showing the vendor URL, product model, and exact KZT price for every component used in `budget.csv`.

## 5. What I would do differently

1. **Fix motherboard/RAM socket mismatches before ordering:** In the initial parts list, `Sales Manager` paired an AM4 CPU (`Ryzen 5 5600X`) with an AM5/DDR5 board (`ASUS Prime B650M-R`), and `Designer` paired a DDR4 board (`Gigabyte B760M DS3H DDR4`) with DDR5 RAM (`G.SKILL Trident Z5`). Next time, I would run PCPartPicker's compatibility filter *before* locking in vendor quotes—switching Sales Manager to an AM5 `Ryzen 5 7600` (or B550 + DDR4) and Designer to a `B760M DDR5` board—so every kit is 100% physically compatible without mid-project revisions.
2. **Reallocate RAM budget to give the Accountant a 27" monitor:** Spending 290,990 KZT on RGB DDR5-5600 kits (`G.SKILL Trident Z5 RGB`) for non-gaming office/dev builds consumed a large portion of the budget; choosing standard non-RGB DDR5-5200/5600 kits would have saved ~120,000 KZT across the builds, enough to upgrade the Accountant to a 27" QHD display and an uninterruptible power supply (UPS) to protect accounting data from power outages.

