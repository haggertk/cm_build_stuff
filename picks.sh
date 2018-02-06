#!/bin/bash

function kpick() {
  repopick $1 || exit 1
}

source build/envsetup.sh

# device/samsung/hlte-common
kpick 205333 # hlte-common: Add hltekor to makefile guards

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
