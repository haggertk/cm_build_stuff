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

# device/samsung/klte-common

# device/samsung/msm8974-common

# kernel/samsung/msm8974

# mata stuff

# -------------- PLATFORM STUFF --------------

# build

# external/toybox

# frameworks/av

# frameworks/opt/telephony

# packages/apps/SetupWizard

# system/core

# system/sepolicy

# updater

# vendor/lineage

# -------------- TOPIC STUFF --------------

exit 0
