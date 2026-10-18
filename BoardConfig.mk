#
# Copyright (C) 2026 The Team Win Recovery Project & OrangeFox Recovery Project
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

DEVICE_PATH := device/infinix/X1201

# For building with minimal manifest
ALLOW_MISSING_DEPENDENCIES := true

# Architecture
TARGET_ARCH := arm64
TARGET_ARCH_VARIANT := armv8-2a
TARGET_CPU_ABI := arm64-v8a
TARGET_CPU_ABI2 :=
TARGET_CPU_VARIANT := cortex-a76

TARGET_2ND_ARCH := arm
TARGET_2ND_ARCH_VARIANT := armv8-2a
TARGET_2ND_CPU_ABI := armeabi-v7a
TARGET_2ND_CPU_ABI2 := armeabi
TARGET_2ND_CPU_VARIANT := cortex-a55

TARGET_BOARD_PLATFORM := mt6789
TARGET_BOARD_PLATFORM_GPU := mali-g57

# Bootloader
TARGET_BOOTLOADER_BOARD_NAME := Infinix-X1201
TARGET_NO_BOOTLOADER := true

# Kernel & DTB
BOARD_PAGE_SIZE := 4096
BOARD_BOOT_HEADER_VERSION := 4
BOARD_KERNEL_BASE := 0x40078000
BOARD_RAMDISK_OFFSET := 0x07c08000
BOARD_TAGS_OFFSET := 0x0bc08000

BOARD_KERNEL_CMDLINE := bootopt=64S3,32N2,64N2

TARGET_PREBUILT_KERNEL := $(DEVICE_PATH)/prebuilt/kernel
TARGET_PREBUILT_DTB := $(DEVICE_PATH)/prebuilt/dtb.img
BOARD_PREBUILT_DTBOIMAGE := $(DEVICE_PATH)/prebuilt/dtbo.img
BOARD_PREBUILT_DTBIMAGE_DIR := $(DEVICE_PATH)/prebuilt
BOARD_INCLUDE_DTB_IN_BOOTIMG := true

# Partitions
BOARD_FLASH_BLOCK_SIZE := 262144
BOARD_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_VENDOR_BOOTIMAGE_PARTITION_SIZE := 67108864
BOARD_DTBOIMG_PARTITION_SIZE := 8388608

# System Root / Recovery configuration
BOARD_BUILD_SYSTEM_ROOT_IMAGE := false
BOARD_USES_GENERIC_KERNEL_IMAGE := true

# Vendor Boot Recovery Configuration
BOARD_BUILD_VENDOR_BOOT_IMAGE := true
BOARD_MOVE_RECOVERY_RESOURCES_TO_VENDOR_BOOT := true
BOARD_INCLUDE_RECOVERY_RAMDISK_IN_VENDOR_BOOT := true
BOARD_USES_RECOVERY_AS_BOOT := false

# Dynamic Partitions
BOARD_SUPER_PARTITION_SIZE := 9663676416
BOARD_SUPER_PARTITION_GROUPS := transsion_dynamic_partitions
BOARD_TRANSSION_DYNAMIC_PARTITIONS_SIZE := 9659482112
BOARD_TRANSSION_DYNAMIC_PARTITIONS_PARTITION_LIST := \
    system \
    system_ext \
    vendor \
    product \
    vendor_dlkm \
    odm_dlkm \
    tr_mi \
    tr_theme \
    tr_region \
    tr_company \
    tr_carrier \
    tr_product \
    tr_preload \
    tr_overlayfs

# A/B System
AB_OTA_UPDATER := true
AB_OTA_PARTITIONS += \
    boot \
    vendor_boot \
    dtbo \
    vbmeta \
    vbmeta_system \
    vbmeta_vendor

# File systems
TARGET_USERIMAGES_USE_EXT4 := true
TARGET_USERIMAGES_USE_F2FS := true

# Recovery UI / TWRP Flags
TW_THEME := portrait_hdpi
DEVICE_RESOLUTION := 1200x2000
RECOVERY_GRAPHICS_FORCE_USE_LINELENGTH := true

# Touch / Brightness
TW_BRIGHTNESS_PATH := "/sys/class/leds/lcd-backlight/brightness"
TW_MAX_BRIGHTNESS := 2047
TW_DEFAULT_BRIGHTNESS := 1024

# Features
TW_INCLUDE_NTFS_3G := true
TW_USE_TOOLBOX := true
TW_INCLUDE_RESETPROP := true
TW_INCLUDE_LIBRESETPROP := true
TW_INPUT_BLACKLIST := "hbtp_vm"
TW_NO_REBOOT_BOOTLOADER := true
TW_HAS_EDL_MODE := false
TW_NO_FASTBOOT_BOOT := true

# Decryption
TW_INCLUDE_CRYPTO := false

# --------------------------------------------------------------------------
# OrangeFox Recovery Project (OFRP) Configuration
# --------------------------------------------------------------------------
OF_MAINTAINER := ikhsanapergu
FOX_BUILD_TYPE := Unofficial
OF_SCREEN_H := 2000
OF_STATUS_H := 80
OF_STATUS_INDENT_LEFT := 48
OF_STATUS_INDENT_RIGHT := 48
OF_CLOCK_POS := 1
OF_ALLOW_DISABLE_NAVBAR := 0
OF_HIDE_NOTCH := 1
OF_USE_GREEN_LED := 0
OF_FLASHLIGHT_ENABLE := 0
FOX_TARGET_DEVICES := X1201,Infinix-X1201
FOX_USE_TWRP_RECOVERY_IMAGE_BUILDER := 1
FOX_VANILLA_BUILD := 1
OF_MANUAL_ROOT_VENDOR_ERROR_FIX := 1
