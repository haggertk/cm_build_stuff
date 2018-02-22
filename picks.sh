#!/bin/bash

function kpick() {
  repopick $1 || exit 1
}

source build/envsetup.sh

# -------------- DEVICE STUFF --------------

# device/samsung/hlte-common
kpick 207220 # hlte-common: Update kernel exfat flag

# device/samsung/hlte-common
kpick 207271 # klte-common: Update kernel exfat flag

# device/samsung/msm8974-common
kpick 207146 # msm8974-common: Remove exfat and ntfs sepolicies

# kernel/samsung/msm8974
kpick 207142 # fs: Add sdfat
kpick 207143 # fs: sdfat: Fix compilation on Linux 3.4
kpick 207144 # fs: exfat: Allow disabling exfat
kpick 207145 # ARM: configs: lineage_*: Enable sdfat
kpick 207162 # fs: sdfat: Fix compilation without debugging
kpick 207163 # fs: sdfat: Allow disabling sdfat

# -------------- PLATFORM STUFF --------------

# devide/lineage/sepolicy
kpick 207148 # sepolicy: Cleanup context labelling for external sdcards
kpick 207128 # common: Label sdfat as vfat

# frameworks/av
kpick 206430 # CameraService: Fix deadlock in binder death cleanup.
kpick 206431 # libstagefright: Free buffers on observer died
kpick 206432 # Camera: fix use after disconnect error
kpick 206433 # stagefright: ACodec: Resolve empty vendor parameters usage
kpick 206434 # media: fix infinite wait at source for HAL1 based recording
kpick 206435 # libstagefright: use 64-bit usage for native_window_set_usage
kpick 206427 # camera/media: Support legacy HALv1 camera in mediaserver

# frameworks/base
kpick 206131 # NightDisplayTile: disable if LiveDisplay feature is available

# packages/apps/Nfc
kpick 206115 # NfcNci: make T3T/Nfc-F HCE optional

# packages/apps/Settings
kpick 206403 # settings: Kill night mode if we have LiveDisplay

# system/core
d=`pwd`
cd system/core || exit 1
git remote remove blek > /dev/null 2>&1
git remote add blek https://github.com/invisiblek/android_system_core.git || exit 1
git fetch blek lineage-15.1_safetynet || exit 1
git cherry-pick 96c4433e || exit 1 # init: I hate safety net
cd "$d" || exit 1

# system/sepolicy
kpick 206428 # Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
kpick 206429 # Adapt add_service uses for TARGET_HAS_LEGACY_CAMERA_HAL1
kpick 207219 # Revert "sepolicy: Add missing exfat and fuseblk types"
kpick 207150 # Revert "sepolicy: Fix up exfat and ntfs support"

# system/vold
kpick 207151 # vold: Make exfat driver support generic
kpick 207154 # vold: Don't disable dirsync for exfat
kpick 207240 # vold: Only include exfat support for devices that specify a driver

# vendor/lineage
kpick 206426 # soong_config: Add TARGET_HAS_LEGACY_CAMERA_HAL1 variable
kpick 206996 # soong_config: Add TARGET_USES_MEDIA_EXTENSIONS variable

# -------------- TOPIC STUFF --------------

repopick -t advanced-display || exit 1
repopick -t advanced-display-samsung-8974 || exit 1
repopick -t oreo-mr1-wallpapers || exit 1

exit 0
