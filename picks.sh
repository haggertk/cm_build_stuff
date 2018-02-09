#!/bin/bash

function kpick() {
  repopick $1 || exit 1
}

source build/envsetup.sh

# device/samsung/hlte-common
kpick 205333 # hlte-common: Add hltekor to makefile guards

# device/samsung/msm8974-common
kpick 205468 # msm8974-common: libril: Fix RIL_Call struct for 64-bit platforms

# system/sepolicy
kpick 198106 # Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
kpick 198107 # Adapt add_service uses for TARGET_HAS_LEGACY_CAMERA_HAL1

# system/core
d=`pwd`
cd system/core || exit 1
git remote remove blek > /dev/null 2>&1
git remote add blek https://github.com/invisiblek/android_system_core.git || exit 1
git fetch blek lineage-15.1_safetynet || exit 1
git cherry-pick 96c4433e || exit 1 # init: I hate safety net
cd "$d" || exit 1

# frameworks/av
kpick 198116 # CameraService: Fix deadlock in binder death cleanup.
kpick 203520 # media: fix infinite wait at source for HAL1 based recording
kpick 203521 # libstagefright: Free buffers on observer died
kpick 203522 # stagefright: ACodec: Resolve empty vendor parameters usage
kpick 201731 # libstagefright: use 64-bit usage for native_window_set_usage
kpick 203523 # Camera: fix use after disconnect error
kpick 198113 # camera/media: Support legacy HALv1 camera in mediaserver

# frameworks/opt/telephony
kpick 200797 # PhoneFactory: fix creating a cdma phone type

# kernel/samsung/msm8974
kpick 205073 # fs: proc: Remove Samsung changes to commandline

# packages/apps/Settings
kpick 199922 # settings: Kill night mode if we have LiveDisplay

# vendor/lineage
kpick 201336 # soong_config: Add TARGET_HAS_LEGACY_CAMERA_HAL1 variable

repopick -t berry

exit 0
