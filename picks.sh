#!/bin/bash

function kpick() {
  repopick $1 || exit 1
}

source build/envsetup.sh

# -------------- DEVICE STUFF --------------

# device/lge/bullhead
kpick 208979 # bullhead: Update makefile guards to allow child variants
kpick 208980 # bullhead: Make setup-makefiles imitate a common repository version

# device/samsung/hlte-common
kpick 213526 # Revert "hlte-common: Enable legacy mediaserver"

# device/samsung/klte-common
kpick 213525 # Revert "klte-common: Enable legacy mediaserver"

# device/samsung/msm8974-common
kpick 213523 # msm8974-common: Enable legacy mediaserver

# kernel/samsung/msm8974

# mata stuff
kpick 204570 # mata: Build textclassifier's smart selection

# -------------- PLATFORM STUFF --------------

# build

# external/toybox
kpick 209019 # toybox: Use ISO C/clang compatible __typeof__ in minof/maxof macros

# frameworks/av
kpick 213062 # Camera: check metadata type before releasing frame

# system/core
kpick 206119 # init: I hate safety net

# system/sepolicy

# updater
kpick 206046 # update_attempter: don't limit the cpu and run in foreground
kpick 206117 # update_verifier: skip verity to determine successful on lineage builds
kpick 206128 # common: add update_engine policies
#kpick 206681 # Updater: fix bad state when opening activity during A/B update
#kpick 206682 # Updater: unbind stale callbacks when reconnecting to A/B

# vendor/lineage

# -------------- TOPIC STUFF --------------

exit 0
