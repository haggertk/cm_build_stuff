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
#if [ -d device/samsung/hlte-common ] ; then

#fi

# device/samsung/klte-common
#if [ -d device/samsung/klte-common ] ; then

#fi

# device/samsung/msm8974-common
#if [ -d device/samsung/msm8974-common ] ; then

#fi

fi # [ $USER != haggertk ]

# -------------- PLATFORM STUFF --------------


# -------------- TOPIC STUFF --------------

exit 0
