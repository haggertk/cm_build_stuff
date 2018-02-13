#!/bin/bash

function kpick() {
  repopick $1 || exit 1
}

source build/envsetup.sh

# -------------- DEVICE STUFF --------------

# device/samsung/hlte-common
kpick 205333 # hlte-common: Add hltekor to makefile guards

# device/samsung/msm8974-common
kpick 205468 # msm8974-common: libril: Fix RIL_Call struct for 64-bit platforms

# -------------- PLATFORM STUFF --------------

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

# vendor/lineage
kpick 206426 # soong_config: Add TARGET_HAS_LEGACY_CAMERA_HAL1 variable

# -------------- TOPIC STUFF --------------
repopick -t adaptive-icons

exit 0
