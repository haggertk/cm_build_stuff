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
#if [ $USER != haggertk ]; then

# device/samsung/hlte-common
#if [ -d device/samsung/hlte-common ] ; then

#fi

# device/samsung/klte-common
#if [ -d device/samsung/klte-common ] ; then

#fi

# device/samsung/msm8974-common
#if [ -d device/samsung/msm8974-common ] ; then

#fi

#fi # [ $USER != haggertk ]

# -------------- PLATFORM STUFF --------------

# bionic
repopick 290067 # Add ability to build scudo-free 32-bit libc variant.

# build
repopick 290066 # soong: Add ability to build scudo-free 32-bit libc variant.
repopick 288657 # Sorry bro: 6 -> 3

# build/soong
repopick 290065 # Add ability to enable scudo-free 32-bit libc variant.

# frameworks/av
repopick 288412 # nuplayer: Avoid crash when codec fails to load
repopick 288413 # camera: Don't segfault if we get a NULL parameter
repopick 288414 # libstagefright: Support YVU420SemiPlanar camera format
repopick 288415 # stagefright: omx: Don't signal dataspace change on legacy QCOM
repopick 288416 # stagefright: ACodec: Resolve empty vendor parameters usage
repopick 288417 # libstagefright: Free buffers on observer died
repopick 288418 # libstagefright: use 64-bit usage for native_window_set_usage
repopick 288419 # camera: include: Don't override possible overlayed header
repopick 288420 # camera/media: Support legacy HALv1 camera in mediaserver
repopick 288421 # Camera: check metadata type before releasing frame
repopick 289200 # libstagefright: Fix memory leak due to lock timeout
repopick 289171 # camera: Allow devices to load custom CameraParameter code

# frameworks/native
repopick 291971 # SurfaceFlinger: Don't cleanup resource from previous frame

# hardware/lineage/interfaces
repopick 287659 # interfaces: Camera: add IAllocator/IMapper 4.0 to camera HIDL
repopick 287660 # interfaces: camera: fix two potential null pointer uses
repopick 287661 # interfaces: camera: Implement lockYCbCr stub for Mapper 4.0

# system/core
repopick 292788 # core: Bring back support for legacy FunctionFS

# system/sepolicy
repopick 292244 # Fix storaged access to /sys/block/mmcblk0/stat after 48027a00

# system/vold
repopick 286947 # vold: add support for more filesystems for public storage
repopick 286948 # vold: Fix fsck on public volumes
repopick 286949 # vold: Support internal storage partitions
repopick 286950 # vold: Honor mount options for ext4/f2fs partitions
repopick 286951 # vold: Mount ext4/f2fs portable storage with sdcard_posix
repopick 286952 # vold ext4/f2fs: do not use dirsync if we're mounting adopted storage
repopick 286953 # Fix the group permissions of the sdcard root.
repopick 286954 # vold: skip first disk change when converting MBR to GPT
repopick 286955 # vold: Accept Linux GPT partitions on external SD cards

# vendor/lineage
repopick 291988 # qcom: Enable TARGET_USES_QCOM_BSP_LEGACY for B family
repopick 292258 # soong: Make QCOM legacy variable name more generic

# -------------- TOPIC STUFF --------------

repopick -t eleven-ultralegacy-devices

exit 0
