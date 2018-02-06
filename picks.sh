#!/bin/bash

function kpick() {
  repopick $1 || exit 1
}

source build/envsetup.sh

# device/samsung/msm8974-common
kpick 204289 # msm8974-common: ril: Import libril from hardware/ril-caf
kpick 204290 # msm8974-common: ril: Makefile maintenance
kpick 204291 # msm8974-common: libril: Add Samsung changes
kpick 204292 # msm8974-common: libril: Fix SMS on certain variants
kpick 204293 # msm8974-common: libril: fix network operator search
kpick 204294 # msm8974-common: libril: Add workaround for "ring of death" bug
kpick 204295 # msm8974-common: libril: Fix RIL_UNSOL_NITZ_TIME_RECEIVED Parcel
kpick 204296 # msm8974-common: libril: Get off my back

# device/samsung/klte-common
kpick 204310 # klte-common: Move ril_{,unsol}_commands_vendor.h to include/
kpick 204311 # klte-common: Drop libril

# hardware/qcom/audio-caf/msm8974
kpick 204892 # audio: revert "remove 5.1 channel mask if SSR is not supported"
kpick 204893 # policy_hal: Enable Direct PCM for 24 bit PCM playback
kpick 204894 # hal: Fix alignement of buffer sent to DSP for multichannel clips
kpick 204895 # audio: Enable 24 bit packed direct pcm support.

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

# packages/apps/Settings
kpick 199922 # settings: Kill night mode if we have LiveDisplay

# vendor/lineage
kpick 201336 # soong_config: Add TARGET_HAS_LEGACY_CAMERA_HAL1 variable

repopick -t berry

exit 0
