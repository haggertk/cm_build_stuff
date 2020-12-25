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

# system/core
repopick 292788 # core: Bring back support for legacy FunctionFS
repopick 291972 # fastboot: Don't fail when unable to get boot partition size

# system/vold
#repopick 286947 # vold: add support for more filesystems for public storage
#repopick 286948 # vold: Fix fsck on public volumes
#repopick 286949 # vold: Support internal storage partitions
#repopick 286950 # vold: Honor mount options for ext4/f2fs partitions
#repopick 286951 # vold: Mount ext4/f2fs portable storage with sdcard_posix
#repopick 286952 # vold ext4/f2fs: do not use dirsync if we're mounting adopted storage
#repopick 286953 # Fix the group permissions of the sdcard root.
#repopick 286955 # vold: Accept Linux GPT partitions on external SD cards

# -------------- TOPIC STUFF --------------

exit 0
