# Lab 3 — Teardown, and the same machine from the command line

Pair: Anuarhan + Ayanat · Date: 11/7/2026

## Part 1 — Ten parts

### 1. AMD Ryzen 5 7600

**Caption:** A desktop CPU with 6 cores and 12 threads. It connects to the AM5 socket on a compatible motherboard. It supports DDR5 memory. Its main limitation is that it cannot be installed in Intel or older AMD sockets.

**Manufacturer links:**
- https://www.amd.com/en/products/processors/desktops/ryzen/7000-series/amd-ryzen-5-7600.html
- https://www.amd.com/en/support/downloads/drivers.html/processors/ryzen/ryzen-7000-series/amd-ryzen-5-7600.html

### 2. Intel Core i5-13400

**Caption:** A desktop CPU with 10 cores and 16 threads. It connects to an LGA 1700 motherboard socket. It supports DDR4 or DDR5 memory, depending on the motherboard. Its main limitation is compatibility with LGA 1700 motherboards only.

**Manufacturer links:**
- https://www.intel.com/content/www/us/en/products/sku/230495/intel-core-i513400-processor-20m-cache-up-to-4-60-ghz/specifications.html
- https://www.intel.com/content/www/us/en/products/sku/230495/intel-core-i513400-processor-20m-cache-up-to-4-60-ghz/downloads.html

### 3. ASUS PRIME B650M-A

**Caption:** A Micro-ATX motherboard that connects the CPU, RAM, storage and other components. It has an AM5 socket, AMD B650 chipset and DDR5 memory support. It supports Ryzen 7000, 8000 and 9000 series processors, subject to BIOS compatibility. It cannot use Intel CPUs or DDR4 memory.

**Manufacturer links:**
- CPU support list: https://www.asus.com/motherboards-components/motherboards/prime/prime-b650m-a/helpdesk_qvl_cpu/
- Technical specifications: https://www.asus.com/motherboards-components/motherboards/prime/prime-b650m-a/techspec/

### 4. MSI PRO B760M-A WIFI DDR4

**Caption:** A Micro-ATX motherboard for Intel desktop processors. It connects the CPU, DDR4 RAM, storage and expansion cards. It uses the LGA 1700 socket and Intel B760 chipset. It supports compatible Intel Core 12th, 13th and 14th generation CPUs, subject to BIOS support. It cannot use DDR5 memory.

**Manufacturer links:**
- CPU support and downloads: https://www.msi.com/Motherboard/PRO-B760M-A-WIFI-DDR4/support
- Technical specifications: https://www.msi.com/Motherboard/PRO-B760M-A-WIFI-DDR4/Specification

### 5. Kingston FURY Beast DDR5-5600, 16 GB

**Caption:** A 16 GB DDR5 desktop memory module operating at 5600 MT/s. It connects to a 288-pin DDR5 DIMM slot on the motherboard. It temporarily stores data used by the CPU. It is not compatible with DDR4 motherboards.

**Manufacturer link:**
- https://www.kingston.com/en/memory/gaming/kingston-fury-beast-ddr5-memory

### 6. Crucial DDR4-3200, 16 GB DIMM

**Caption:** A 16 GB DDR4 desktop memory module operating at 3200 MT/s. It connects to a 288-pin DDR4 DIMM slot. It provides temporary storage for active programs and data. It cannot be installed in DDR5 motherboard slots.

**Manufacturer links:**
- https://www.crucial.com/memory/ddr4
- https://www.crucial.com/support

### 7. Samsung 990 PRO 1 TB

**Caption:** The Samsung 990 PRO is a high-performance 1 TB NVMe solid-state drive. It connects directly to an M.2 M-key slot on a compatible motherboard using the PCIe interface. It stores the operating system, applications and files. Its main limitation is that it requires a compatible M.2 NVMe slot and cannot connect directly to a SATA-only drive bay.

**Manufacturer links:**
- https://www.samsung.com/uk/memory-storage/nvme-ssd/990-pro-1tb-nvme-pcie-gen-4-mz-v9p1t0bw/
- Official Samsung datasheet: https://download.semiconductor.samsung.com/resources/data-sheet/Samsung_NVMe_SSD_990_PRO_Datasheet_Rev.1.0.pdf

### 8. Samsung 870 EVO 1 TB

**Caption:** The Samsung 870 EVO is a 1 TB SATA solid-state drive with a 2.5-inch form factor. It connects to the motherboard through a SATA data cable and receives power through a SATA power connector from the power supply. It stores files, applications and the operating system. Its main limitation is that its SATA interface is slower than modern NVMe PCIe SSDs.

**Manufacturer link:**
- https://www.samsung.com/us/memory-storage/sata-ssd/870-evo-sata-2-5-ssd-1tb-sku-mz-77e1t0b-am/

### 9. Corsair RM750e 750 W

**Caption:** A 750 W ATX power supply that provides electricity to all computer components. It connects to the motherboard, CPU, graphics card and storage devices through power cables. Its limitation is its maximum 750 W output and physical compatibility with the computer case.

**Manufacturer links:**
- https://www.corsair.com/us/en/p/psu/cp-9020262-na/rme-series-rm750e-fully-modular-low-noise-atx-power-supply-cp-9020262-na
- Product manual: https://www.corsair.com/us/en/explorer/diy-builder/power-supply-units/rme-rm750e-power-supply-2023-instruction-manual/

### 10. Stock CPU Coolers

**Caption:** A stock CPU cooler removes heat from the processor using a heatsink and fan. It attaches to the motherboard's CPU mounting system and connects to the CPU_FAN header. The AMD Ryzen 5 7600 boxed version includes an AMD Wraith Stealth cooler. The boxed Intel Core i5-13400 includes an Intel Laminar RM1 cooler. Each cooler is designed for its compatible processor socket and thermal requirements.

**Manufacturer links:**
- AMD Ryzen 5 7600 specifications (lists Wraith Stealth): https://www.amd.com/en/products/processors/desktops/ryzen/7000-series/amd-ryzen-5-7600.html
- Intel boxed processor contents (confirms the i5-13400 includes the Laminar RM1): https://www.intel.com/content/www/us/en/support/articles/000095154/processors.html
- Intel cooler installation and compatibility: https://www.intel.com/content/www/us/en/support/articles/000089627/processors.html

## Two builds

### Build 1 — AMD Ryzen System

| Part        | Model                                | Why it fits here                                  |
| ----------- | ------------------------------------ | ------------------------------------------------- |
| CPU         | AMD Ryzen 5 7600                     | Uses the AM5 socket supported by the motherboard. |
| Motherboard | ASUS PRIME B650M-A                   | Supports Ryzen 7000 CPUs and DDR5 RAM.            |
| Memory      | Kingston FURY Beast DDR5-5600, 16 GB | Compatible with the motherboard's DDR5 slots.     |
| SSD         | Samsung 990 PRO 1 TB                 | Uses the motherboard's M.2 NVMe slot.             |
| PSU         | Corsair RM750e 750 W                 | Supplies enough power for this configuration.     |
| Cooler      | AMD Wraith Stealth                   | Compatible with the Ryzen 5 7600.                 |

### Build 2
### Build 2 — Intel System

| Part        | Model                     | Why it fits here                                   |
| ----------- | ------------------------- | -------------------------------------------------- |
| CPU         | Intel Core i5-13400       | Uses the LGA 1700 socket.                          |
| Motherboard | MSI PRO B760M-A WIFI DDR4 | Supports Intel 12th–14th generation CPUs and DDR4. |
| Memory      | Crucial DDR4-3200, 16 GB  | Compatible with the motherboard's DDR4 slots.      |
| SSD         | Samsung 870 EVO 1 TB      | Connects through the motherboard's SATA interface. |
| PSU         | Corsair RM750e 750 W      | Supplies power to all components.                  |
| Cooler      | Intel Laminar RM1         | Compatible with the boxed Intel processor.         |
What each build still needs:

Both computers need a PC case, monitor, keyboard, mouse and operating system. Additional case fans may be needed for proper airflow. A dedicated graphics card is optional because both processors have integrated graphics.

## Part 2 — Same facts, two computing environments
Hardware fact	Windows Host	Linux VM
CPU	AMD Ryzen 5 7535HS	AMD Ryzen 5 7535HS (virtualized)
CPU cores / vCPUs	6 physical cores	4 virtual CPUs
Logical processors	12	4
Architecture	x86_64	x86_64
RAM	16 GB	1.6 GiB
Memory speed	5600 MT/s (configured at 4800 MT/s)	Not reported
Storage	512 GB Kingston NVMe SSD	25 GB virtual disk
Filesystem	NTFS	Linux filesystem
Environment	Physical computer	Virtual machine

Windows and Linux use different commands and tools to display hardware information. Windows uses PowerShell commands such as Get-CimInstance, while Linux uses lscpu, free -h and lsblk. Linux runs inside a virtual machine, so it sees allocated virtual resources rather than all the physical resources of the host computer.

## What did not work the first time

Copying and pasting commands in the Linux environment did not work at first. Because of this, I had to type all the commands manually when creating the `linux-specs.txt` file. I did not experience this problem in Windows, where copying and pasting worked correctly.
## Evidence
- evidence/windows-specs.txt - evidence/linux-specs.txt

  # Hardware Components and System Build Report

## Step 1 & 2 — Component Specifications and Captions

### 1. Processors

#### AMD Ryzen 5 7600
![AMD Ryzen 5 7600](evidence/photos/ryzen5-7600.png)  
**Source:** [AMD Official Page](https://amd.com)  
**Caption:** 6 cores / 12 threads desktop processor, 3.8 GHz base / 5.1 GHz boost clock, 32 MB L3 cache, 65 W TDP. Connects to an AM5 motherboard socket; its memory controller supports DDR5 memory. Limit: fits only Socket AM5 motherboards (e.g., B650, X670) and works only with DDR5 RAM.

#### Intel Core i5-13400
![Intel Core i5-13400](evidence/photos/i5-13400.png)  
**Source:** [Intel Official Page](https://intel.com)  
**Caption:** 10 cores (6P + 4E) / 16 threads desktop processor, 2.5 GHz base / 4.6 GHz boost clock, 20 MB L3 cache, 65 W base power (TDP). Connects to an LGA 1700 motherboard socket; its memory controller supports DDR4 and DDR5 memory. Limit: fits only Socket LGA 1700 motherboards (Intel 600/700 series) and relies on the board's RAM type.

---

### 2. Motherboards

#### ASUS PRIME B650M-A
![ASUS PRIME B650M-A](evidence/photos/asus-b650m-a.png)  
**Source:** [ASUS Product Page](https://asus.com) | [Tech Specs](https://asus.comtechspec/)  
**Caption:** Micro-ATX motherboard with the AMD B650 chipset. Connects to an AM5 processor, 4× DDR5 DIMM memory slots, 2× M.2 slots (PCIe 5.0/4.0), and 4× SATA 6 Gb/s ports. Limit: supports only AMD Ryzen 7000/8000/9000 series CPUs (on the CPU Support list) and accepts only DDR5 memory.

#### MSI PRO B760M-A WIFI DDR4
![MSI PRO B760M-A WIFI DDR4](evidence/photos/msi-b760m-a.png)  
**Source:** [MSI Product Page](https://msi.com) | [Specification](https://msi.com/Specification)  
**Caption:** Micro-ATX motherboard with the Intel B760 chipset. Connects to an LGA 1700 processor, 4× DDR4 DIMM memory slots, 2× M.2 slots (PCIe 4.0 x4), and 4× SATA 6 Gb/s ports. Limit: supports only 12th/13th/14th Gen Intel Core processors (on the CPU Support list) and accepts only DDR4 memory.

---

### 3. Memory

#### Kingston FURY Beast DDR5-5600, 16 GB
![Kingston FURY Beast DDR5](evidence/photos/kingston-ddr5.png)  
**Source:** [Kingston Product Page](https://kingston.com) | [Datasheet PDF](https://kingston.com)  
**Caption:** DDR5 DIMM memory module, 16 GB, 5600 MT/s, 288 pins. Connects to a desktop DDR5 DIMM slot on the motherboard. Limit: fits only DDR5 motherboards; the key notch position makes DDR4 slots impossible.

#### Crucial DDR4-3200, 16 GB DIMM
![Crucial DDR4](evidence/photos/crucial-ddr4.png)  
**Source:** [Crucial Product Page](https://crucial.com)  
**Caption:** DDR4 DIMM memory module, 16 GB, 3200 MT/s, 288 pins. Connects to a desktop DDR4 DIMM slot on the motherboard. Limit: fits only DDR4 motherboards; the key notch position makes DDR5 slots impossible.

---

### 4. SSDs

#### Samsung 990 PRO 1 TB
![Samsung 990 PRO](evidence/photos/samsung-990pro.png)  
**Source:** [Samsung NVMe SSD Page](https://samsung.com)  
**Caption:** 1 TB SSD, NVMe PCIe 4.0 x4 interface, M.2 2280 form factor, up to 7,450 MB/s read and 6,900 MB/s write speed. Connects to an M.2 (M-key) slot on the motherboard. Limit: maximum transfer speed is capped by the PCIe generation of the M.2 slot (e.g., ~3,500 MB/s on PCIe 3.0).

#### Samsung 870 EVO 1 TB
![Samsung 870 EVO](evidence/photos/samsung-870evo.png)  
**Source:** [Samsung SATA SSD Page](https://samsung.com)  
**Caption:** 1 TB SSD, SATA III (6 Gb/s) interface, 2.5-inch form factor, up to 560 MB/s read and 530 MB/s write speed. Connects to a motherboard SATA port via a SATA data cable plus a SATA power cable from the PSU. Limit: the SATA III bus caps real-world transfer speeds at about 550 MB/s.

---

### 5. Power and Cooling

#### Corsair RM750e (750 W)
![Corsair RM750e](evidence/photos/corsair-rm750e.png)  
**Source:** [Corsair Product Page](https://corsair.com)  
**Caption:** 750 W power supply, 80 PLUS Gold efficiency rating, ATX 3.0 standard, fully modular. Connects to the motherboard (24-pin ATX and 8-pin CPU cables), drives (SATA power), and graphics card (PCIe / 12V-2x6). Limit: total system power draw cannot exceed 750 W.

#### Stock Processors Coolers (AMD Wraith Stealth & Intel Laminar RM1)
![Stock Coolers](evidence/photos/stock-coolers.png)  
**Source:** [AMD Thermal Solutions](https://amd.com) | [Intel Laminar Coolers Overview](https://intel.com)  
**Caption:** AMD Wraith Stealth (included with boxed Ryzen 5 7600) / Intel Laminar RM1 (included with boxed Core i5-13400) stock air coolers. Connects to the processor's socket mounting holes (AM5 or LGA 1700) and the CPU_FAN header. Limit: rated for up to 65 W TDP processors, so they cannot safely cool high-wattage or overclocked CPUs.

---

## Step 3 — Motherboards Deep Dive

### 1. ASUS PRIME B650M-A
* **Socket:** AMD Socket AM5
* **Chipset:** AMD B650
* **Memory:** DDR5, 4× DIMM slots (dual-channel, supports AMD EXPO profiles)
* **Storage connections:** 2× M.2 slots (Key M, type 2242/2260/2280 — 1× PCIe 5.0 x4, 1× PCIe 4.0 x4) and 4× SATA 6 Gb/s ports
* **Supported processor generations:** 
  * AMD Ryzen 7000 Series (supported out of the box).
  * AMD Ryzen 8000 and 9000 Series (requires a BIOS update).

### 2. MSI PRO B760M-A WIFI DDR4
* **Socket:** Intel Socket LGA 1700
* **Chipset:** Intel B760
* **Memory:** DDR4, 4× DIMM slots (dual-channel, supports Intel XMP profiles)
* **Storage connections:** 2× M.2 slots (Key M, type 2242/2260/2280 — both PCIe 4.0 x4) and 4× SATA 6 Gb/s ports
* **Supported processor generations:** 
  * 12th Gen Intel Core and 13th Gen Intel Core (supported out of the box).
  * 14th Gen Intel Core (requires a BIOS update).

---

## Step 4 — Build Two Computers on Paper

All 10 parts from the list have been sorted into two functional PC builds based strictly on hardware facts and socket compatibility rules.

### Build A (AMD AM5 / DDR5 Platform)

| Part | Model | Why it fits here |
| :--- | :--- | :--- |
| **Processor** | AMD Ryzen 5 7600 | Uses an AM5 package and its memory controller natively runs DDR5, matching the ASUS board. |
| **Motherboard** | ASUS PRIME B650M-A | Provides the physical AM5 socket for the CPU, DDR5 memory slots, and PCIe M.2 slots. |
| **Memory** | Kingston FURY Beast DDR5-5600, 16 GB | DDR5 DIMM type matches the motherboard's memory technology requirement. |
| **SSD** | Samsung 990 PRO 1 TB (NVMe) | Fits perfectly into the motherboard's high-speed M.2 PCIe 4.0/5.0 slot. |
| **Cooler** | AMD Wraith Stealth | Included in the boxed CPU package, fits AM5 spacing, and easily handles the 65W TDP. |
| **Power Supply**| Corsair RM750e (750 W) | Delivers 24-pin ATX and 8-pin CPU modular power cords needed to power up the system. |

* **What Build A still needs to switch on:** A PC case (for the power button), a monitor, and input peripherals (keyboard/mouse). *Note: The CPU features integrated Radeon graphics, so no dedicated GPU is required to boot.*

---

### Build B (Intel LGA 1700 / DDR4 Platform)

| Part | Model | Why it fits here |
| :--- | :--- | :--- |
| **Processor** | Intel Core i5-13400 | Fits the LGA 1700 socket configuration and supports DDR4 memory platforms. |
| **Motherboard** | MSI PRO B760M-A WIFI DDR4 | Features the required LGA 1700 socket and native DDR4 DIMM memory architecture. |
| **Memory** | Crucial DDR4-3200, 16 GB DIMM | DDR4 standard physically and electronically matches the MSI motherboard slots. |
| **SSD** | Samsung 870 EVO 1 TB (SATA) | Connects to the board's SATA 6 Gb/s bus, using the standard chipset storage controller. |
| **Cooler** | Intel Laminar RM1 | Included in the boxed Intel retail pack, fits LGA 1700 mounting holes, and manages 65W base power. |
| **Power Supply**| *Missing component* | There was only one power supply unit included in the provided 10-part checklist. |

* **What Build B still needs to switch on:** **A second Power Supply Unit (PSU)** (since the Corsair unit went to Build A), a **SATA data cable** (to bridge the 870 EVO to the board), a PC case, a monitor, and a keyboard/mouse. *Note: The i5-13400 includes Intel UHD Graphics 730, allowing it to display video output without a standalone GPU.*

