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
  repopick 241825 # hlte-common: Update power profile for Pie
  repopick 225618 # hlte-common: Align ril.h to samsung_msm8974-common P libril changes
fi

# device/samsung/klte-common
if [ -d device/samsung/klte-common ] ; then
  repopick 242366 # klte-common: Update power profile for Pie
  repopick 225192 # klte-common: Align ril.h to samsung_msm8974-common P libril changes
fi

# device/samsung/msm8974-common
if [ -d device/samsung/msm8974-common ] ; then
  repopick 241858 # msm8974-common: Build Samsung LiveDisplay service
fi

fi # [ $USER != haggertk ]

# -------------- PLATFORM STUFF --------------

# frameworks/base
repopick 235986 # frameworks: Add unlinked ringtone and notification volumes
repopick 233633 # Phone ringtone setting for Multi SIM device
repopick 248662 # Fix bugs regarding system app cannot write visible path

# hardware/samsung
repopick 239597 # samsung: Add dummy lineagehw HIDL interfaces for vendor.lineage.livedisplay
repopick 239598 # hidl: livedisplay: Add binderized service implementation

# packages/apps/Settings
repopick 235978 # Settings: Add switch for linked ring and media notification volumes
repopick 236184 # Settings: Use correct icon for ring volume
repopick 233634 # Phone ringtone setting for Multi SIM device
repopick 227120 # Settings: Check interfaces before enabling ADB over network

# packages/apps/Snap
repopick 248663 # Snap: Save SDCard photos to legacy path

# packages/services/Telecomm
repopick 233635 # Phone ringtone setting for Multi SIM device

# system/core
privpick system/core refs/changes/19/206119/2 # init: I hate safety net

# -------------- TOPIC STUFF --------------

exit 0
