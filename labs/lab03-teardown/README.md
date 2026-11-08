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
