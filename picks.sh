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

# external/chromium-webview
repopick 325922 # Update arm{,64} Chromium Webview to 99.0.4844.73

# frameworks/base
repopick 318763 # SystemUI: runtime configurable audio panel location
repopick 321160 # Keyguard: Allow disabling fingerprint wake-and-unlock
repopick 320714 # SystemUI: add burnIn protection

# packages/apps/Trebuchet
repopick 317967 # Enable crossfade when changing theme
repopick 317969 # Expose themed icon setting in ThemePicker

# -------------- TOPIC STUFF --------------

exit 0
