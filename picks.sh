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
fi

# device/samsung/klte-common
if [ -d device/samsung/klte-common ] ; then
  repopick 225192 # klte-common: Align ril.h to samsung_msm8974-common P libril changes
fi

# device/samsung/msm8974-common
if [ -d device/samsung/msm8974-common ] ; then
  repopick 235457 # msm8974-common: sepolicy: Limit execmod to specifically labeled files
fi

# kernel/samsung/msm8974
if [ -d kernel/samsung/msm8974] ; then
  repopick 234754 # Add define for O_TMPFILE
fi

fi # [ $USER != haggertk ]

# -------------- PLATFORM STUFF --------------

# device/qcom/sepolicy-legacy
#repopick 239736 # sepolicy-legacy: Allow vold to open keymaster firmware

# frameworks/base
repopick 224266 # SystemUI: Add Lineage statusbar item holder
repopick 224267 # SystemUI: Network Traffic [1/3]
repopick 235986 # frameworks: Add unlinked ringtone and notification volumes
repopick 233633 # Phone ringtone setting for Multi SIM device

# packages/apps/Settings
repopick 235978 # Settings: Add switch for linked ring and media notification volumes
repopick 236184 # Settings: Use correct icon for ring volume
repopick 233634 # Phone ringtone setting for Multi SIM device
repopick 227120 # Settings: Check interfaces before enabling ADB over network

# packages/services/Telecomm
repopick 233635 # Phone ringtone setting for Multi SIM device

# system/core
privpick system/core refs/changes/19/206119/2 # init: I hate safety net

# -------------- TOPIC STUFF --------------


exit 0
