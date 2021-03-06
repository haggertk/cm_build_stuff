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

# build
repopick 288657 # Sorry bro: 6 -> 3

# frameworks/base
repopick 294860 # NavBar: Don't crash when we can't find navigation overlays

# lineage-sdk
repopick 294783 # Profile: Don't NPE when service is not started

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

# -------------- TOPIC STUFF --------------

repopick -t eleven-ultralegacy-devices

exit 0
