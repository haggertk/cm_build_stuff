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
repopick 317786 # monet: Add support for monet (cam16)
repopick 318763 # SystemUI: runtime configurable audio panel location
repopick 321160 # Keyguard: Allow disabling fingerprint wake-and-unlock
repopick 320714 # SystemUI: add burnIn protection

# packages/apps/Trebuchet
repopick 317966 # Enable new app open/close animations
repopick 317967 # Enable crossfade when changing theme
repopick 317968 # Enable new keyguard-to-launcher animation
repopick 317969 # Expose themed icon setting in ThemePicker
repopick 318383 # Enable local colors for popup menu items
repopick 318384 # Add ripple animation to task menu items
repopick 320939 # Implement LocalColorExtractor using monet theme engine

# vendor/lineage
repopick 318283 # overlay: core: Remove accent color overrides
repopick 317788 # overlay: Enable monet

# -------------- TOPIC STUFF --------------

exit 0
