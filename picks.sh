#!/bin/bash

function kpick() {
  repopick $1 || exit 1
}

source build/envsetup.sh

# device/samsung/msm8974-common
kpick 203120 # msm8974: Enable full dex preopt
kpick 204289 # msm8974-common: ril: Import libril from hardware/ril-caf
kpick 204290 # msm8974-common: ril: Makefile maintenance
kpick 204291 # msm8974-common: libril: Add Samsung changes
kpick 204292 # msm8974-common: libril: Fix SMS on certain variants
kpick 204293 # msm8974-common: libril: fix network operator search
kpick 204294 # msm8974-common: libril: Add workaround for "ring of death" bug
kpick 204295 # msm8974-common: libril: Fix RIL_UNSOL_NITZ_TIME_RECEIVED Parcel
kpick 204296 # msm8974-common: libril: Get off my back
kpick 203303 # Revert "msm8974-common: Use QTI HIDL power HAL"

# device/samsung/klte-common
kpick 204310 # klte-common: Move ril_{,unsol}_commands_vendor.h to include/
kpick 204311 # klte-common: Drop libril
kpick 203304 # klte-common: power: Add legacy qcom HAL compat code

# device/qcom/sepolicy
kpick 202830 # legacy: Add back legacy sensors rules
kpick 202995 # legacy: Address mpdecision denials

# system/sepolicy
kpick 198106 # Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
kpick 198107 # Adapt add_service uses for TARGET_HAS_LEGACY_CAMERA_HAL1

# system/core
kpick 202849 # Update permissions to the superuser binary
kpick 204100 # adbd: Disable "adb root" by system property (2/3)
d=`pwd`
cd system/core || exit 1
git remote remove blek > /dev/null 2>&1
git remote add blek https://github.com/invisiblek/android_system_core.git || exit 1
git fetch blek lineage-15.1_safetynet || exit 1
git cherry-pick 96c4433e || exit 1 # init: I hate safety net
cd "$d" || exit 1

# frameworks/base
kpick 201879 # appops: Privacy Guard for O

# frameworks/av
kpick 198116 # CameraService: Fix deadlock in binder death cleanup.
kpick 203520 # media: fix infinite wait at source for HAL1 based recording
kpick 203521 # libstagefright: Free buffers on observer died
kpick 203522 # stagefright: ACodec: Resolve empty vendor parameters usage
kpick 201731 # libstagefright: use 64-bit usage for native_window_set_usage
kpick 203523 # Camera: fix use after disconnect error
kpick 198113 # camera/media: Support legacy HALv1 camera in mediaserver

# frameworks/native
kpick 201530 # AppOpsManager: Update with the new ops

# packages/apps/Settings
kpick 201531 # Settings: Add developer setting for root access
kpick 204128 # Settings: Set root access options appropriately
kpick 204127 # Settings: Root appops access in developer settings
kpick 201529 # Settings: Privacy Guard
kpick 199922 # settings: Kill night mode if we have LiveDisplay

# packages/apps/LineageParts
kpick 201528 # PrivacyGuard: Bring up and inject into Settings

# vendor/lineage
kpick 201336 # soong_config: Add TARGET_HAS_LEGACY_CAMERA_HAL1 variable

# Dark-theme - putting this last because need to manually-resolve change
kpick 201327 # overlays: Overlay Settings for Dark UI [1/2]
kpick 201329 # SysuiDarkThemeOverlay: Initial Dark UI changes
kpick 201330 # overlays: Overlay Settings for Dark UI [2/2]
kpick 200153 # StatusBar: Add dark theme toggle [1/3]
kpick 200154 # LineageSettings: Add dark theme toggle [2/3]
kpick 200155 # Settings: Add toggle for dark theme [3/3]

exit 0
