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

# -------------- PLATFORM STUFF --------------

# frameworks/base
#repopick 318763 # SystemUI: runtime configurable audio panel location
repopick 320714 # SystemUI: add burnIn protection
privpick frameworks/base baf2e2f48a4ef6b64e67ad6dfd7740113058aad7 # Alter model name to avoid SafetyNet HW attestation enforcement
privpick frameworks/base f96f3f09b4cadfbf0474ab633ad33f55c6449e90 # keystore: Block key attestation for SafetyNet

# packages/apps/Trebuchet
repopick 317967 # Enable crossfade when changing theme
repopick 317969 # Expose themed icon setting in ThemePicker

# -------------- TOPIC STUFF --------------

exit 0
