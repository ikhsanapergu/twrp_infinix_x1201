# TWRP Device Tree for Infinix XPAD 20 Pro (X1201)

This repository contains the Team Win Recovery Project (TWRP) device tree for the **Infinix XPAD 20 Pro (Model: X1201)**.

---

## 📱 Device Specifications

| Feature | Details |
|---|---|
| **Device Model** | Infinix XPAD 20 Pro (`Infinix-X1201`) |
| **SoC** | MediaTek Helio G100 / MT6789 |
| **CPU** | Octa-core (2x Cortex-A76 + 6x Cortex-A55) |
| **GPU** | Mali-G57 MC2 |
| **Display Resolution** | 1200 x 2000 (IPS LCD, 90Hz) |
| **Base Android Version** | Android 14 / Android 15 (XOS) |
| **Boot Header** | Version 4 (`v4`) |
| **Partition Scheme** | Virtual A/B (VAB) + Dynamic Partitions (Super) |
| **Recovery Location** | `vendor_boot` partition |

---

## ⚠️ Important Partition Architecture

On modern MediaTek MT6789 devices with Android Boot Header v4:
- There is **NO dedicated `recovery` partition**.
- The recovery ramdisk is bundled directly inside **`vendor_boot.img`**.
- TWRP must be flashed to `vendor_boot` (`vendor_boot_a` / `vendor_boot_b`), **NOT** to `recovery`.

---

## 🛠️ How to Build TWRP

### Method 1: Using GitHub Actions (Automated Cloud Build)
1. Push this folder to a GitHub repository.
2. Go to the **Actions** tab on your GitHub repository.
3. Select **Build TWRP for Infinix XPAD 20 Pro (X1201)**.
4. Click **Run workflow** (select `twrp-12.1`).
5. Download the compiled `vendor_boot.img` from the artifacts once the build finishes.

---

### Method 2: Local Linux / WSL Build
1. **Initialize minimal TWRP manifest:**
   ```bash
   repo init --depth=1 -u https://github.com/minimal-manifest-twrp/platform_manifest_twrp_aosp.git -b twrp-12.1
   repo sync -c --no-clone-bundle --no-tags --optimized-fetch --prune --force-sync -j$(nproc --all)
   ```

2. **Clone this device tree into:**
   ```bash
   device/infinix/X1201
   ```

3. **Build vendor_boot image:**
   ```bash
   source build/envsetup.sh
   export ALLOW_MISSING_DEPENDENCIES=true
   lunch twrp_X1201-eng
   mka vendorbootimage -j$(nproc --all)
   ```

4. The output will be generated at:
   ```bash
   out/target/product/X1201/vendor_boot.img
   ```

---

## ⚡ How to Flash Safely

1. **Unlock Bootloader** on your Infinix XPAD 20 Pro via Developer Options & Fastboot:
   ```bash
   fastboot flashing unlock
   ```

2. **Disable Verity (Avoid Red State / Bootloop):**
   ```bash
   fastboot flash --disable-verity --disable-verification vbmeta vbmeta.img
   ```

3. **Flash TWRP into Vendor Boot:**
   ```bash
   fastboot flash vendor_boot vendor_boot.img
   ```

4. **Reboot to Recovery:**
   Immediately hold `Power + Volume Up` to boot directly into TWRP.
