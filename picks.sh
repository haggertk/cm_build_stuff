#!/bin/bash

set -e

function privpick() {
  git -C $1 fetch github $2
  git -C $1 cherry-pick FETCH_HEAD
}

function checkchain() {
  git -C $1 fetch github $2
  git -C $1 checkout FETCH_HEAD
}

source build/envsetup.sh

# -------------- DEVICE STUFF --------------

# I'm holding these on a local branch, so I don't need to pick them.
# This will be revisited if anyone else starts helping with bring-up
# of these devices.
if [ $USER != haggertk ]; then

# device/samsung/hlte-common
if [ -d device/samsung/hlte-common ] ; then
  repopick 225618 # hlte-common: Align ril.h to samsung_msm8974-common P libril changes
  repopick 225619 # DO NOT MERGE: hlte-common: Requisite bring-up BS change
fi

# device/samsung/klte-common
if [ -d device/samsung/klte-common ] ; then
  repopick 234490 # klte-common: restorecon I/O scheduler tunables before touching them
  repopick 231209 # klte-common: nfc: pn547: Use prebuilt NFC HAL from 15.1
  repopick 225192 # klte-common: Align ril.h to samsung_msm8974-common P libril changes
  repopick 224917 # DO NOT MERGE: klte-common: Requisite bring-up BS change
fi

# device/samsung/msm8974-common
if [ -d device/samsung/msm8974-common ] ; then
  repopick 234524 # msm8974-common: sepolicy: Resolve rild denials
  repopick 234526 # msm8974-common: sepolicy: Resolve mediaserver denials
  repopick 234692 # msm8974-common: sepolicy: Resolve dnsmasq denials
fi

# kernel/samsung/msm8974
if [ -d kernel/samsung/msm8974] ; then
  repopick 234754 # Add define for O_TMPFILE
fi

fi # [ $USER != haggertk ]

# -------------- PLATFORM STUFF --------------

# build/kati
repopick 225213 # Do not limit threads upon calling legacy GNU make

# build/make
repopick 222760 # Add LOCAL_AIDL_FLAGS
repopick 222742 # build: Use project pathmap for recovery

# build/soong
repopick 224613 # soong: Add LOCAL_AIDL_FLAGS handling

# dalvik
repopick 225475 # dexdeps: Add option for --include-lineage-classes.
repopick 225476 # dexdeps: Ignore static initializers on analysis.

# device/lineage/sepolicy
repopick 234487 # common: Label and allow init to write to I/O sched tuning nodes
repopick 234613 # common: common: Expand labeling of sysfs_vibrator nodes using genfscon
repopick 234837 # common: Label and allow access over LiveDisplay sysfs nodes

# device/qcom/sepolicy
repopick 228566 # qcom: Label vendor files with (vendor|system/vendor) instead of vendor
repopick 228569 # Use set_prop() macro for property sets
repopick 228570 # sepolicy: Allow wcnss_service to set wlan.driver properties
repopick 228572 # sepolicy: Allow system_server to 'read' qti_debugfs
repopick 228573 # sepolicy: Add libsdm-disp-vndapis and libsdmutils to SP-HALs
repopick 228576 # sepolicy: Label mpctl_socket as data_file_type
repopick 228578 # sepolicy: rules to allow camera daemon access to app buffer
repopick 228580 # hal_gnss_default: Do not log udp socket failures
repopick 228582 # sepolicy: qti_init_shell needs to read dir too
repopick 228583 # sepolicy: allow vold to read persist dirs
repopick 228584 # sepolicy: Fix video4linux "name" node labeling
repopick 228585 # sepolicy: Allow mm-qcamerad to access v4L "name" node
repopick 228586 # common: Fix labelling of lcd-backlight

# device/qcom/sepolicy-legacy
repopick 231054 # NFC: Add nfc data file context and rename property
repopick 230235 # common: grant DRM HIDL HAL ownership access to /data/{misc,vendor}/media/

# frameworks/base
repopick 226236 # SystemUI: add navbar button layout inversion tuning
repopick 227108 # SystemUI: Fix several issues in the ADB over Network tile
repopick 227821 # GlobalScreenshot: Fix screenshot not saved when appending appname with some languages
repopick 229230 # SystemUI: allow the power menu to be relocated
repopick 224513 # SystemUI: Disable config_keyguardUserSwitcher on sw600dp
repopick 224266 # SystemUI: Add Lineage statusbar item holder
repopick 224267 # SystemUI: Network Traffic [1/3]
repopick 226343 # CameraServiceProxy: Loosen UID check
repopick 230016 # Implement expanded desktop feature

# frameworks/native
repopick 224443 # libbinder: Don't log call trace when waiting for vendor service on non-eng builds
repopick 225546 # AppOpsManager: Update with the new ops

# hardware/interfaces
repopick 225506 # Camed HAL extension: Added support in HIDL for Extended FD.
repopick 225507 # camera: Only link and use vendor.qti.hardware.camera.device if specified

# hardware/lineage/interfaces
repopick 233911 # Tuning of binder buffer for ARM devices
repopick 223374 # interfaces: Add 2.0 livedisplay interfaces
repopick 223410 # interfaces: Add touch HIDL interface definitions

# packages/apps/Camera2
repopick 224752 # Use mCameraAgentNg for getting camera info when available
repopick 225265 # Add Storage preference (1/2)

# packages/apps/LineageParts
repopick 230017 # LineageParts: Re-enable expanded desktop.

# packages/apps/Settings
repopick 226148 # Settings: "Security & location" -> "Security & privacy"
repopick 226142 # Settings: Add developer setting for root access
repopick 226151 # Settings: show Trust brading in confirm_lock_password UI
repopick 226154 # fingerprint: Allow devices to configure sensor location
repopick 227120 # Settings: Check interfaces before enabling ADB over network
repopick 231590 # SimSettings: Add manual SIM provisioning support

# system/core
privpick system/core refs/changes/19/206119/2 # init: I hate safety net

# system/sepolicy
repopick 230151 # Fix storaged access to /sys/block/mmcblk0/stat after c936223c
repopick 234868 # sepolicy: Address denials for legacy last_kmsg file
repopick 234884 # Allow init to write to /proc/cpu/alignment
repopick 234886 # Allow init to chmod/chown /proc/slabinfo

# vendor/lineage
repopick 234352 # lineage-iosched: restorecon slice_idle on scheduler change
repopick 225921 # overlay: Update list of GSF/GMS activities

# -------------- TOPIC STUFF --------------

checkchain packages/apps/Snap refs/changes/23/233223/11 # pie-snap
repopick -t pie-fde-crash-fix

exit 0
