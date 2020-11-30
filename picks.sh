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

# frameworks/native
repopick 291971 # SurfaceFlinger: Don't cleanup resource from previous frame

# hardware/qcom-caf/msm8974/audio
repopick 293116 # audio: Add audio headers lib
repopick 293117 # audio: Include media headers

# hardware/qcom-caf/msm8974/display
repopick 293118 # display: Add display headers lib

# hardware/qcom-caf/msm8974/media
repopick 293114 # media: Add media headers lib
repopick 293115 # media: Include display headers

# packages/apps/Gallery2
repopick -p 294650 # Gallery2: Remove LOCAL_NDK_STL_VARIANT

# packages/apps/Snap
repopick -p 294911 # Snap: Remove saving to sdcard

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
repopick 291988 # soong: Add flag for disabling postrender cleanup

# -------------- TOPIC STUFF --------------

repopick -t eleven-ultralegacy-devices

exit 0
