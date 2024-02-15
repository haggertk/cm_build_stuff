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

# -------------- ASB STUFF --------------

# -------------- DEVICE STUFF --------------

# -------------- PLATFORM STUFF --------------

# frameworks/base
repopick -f -t 21-snet

# -------------- TOPIC STUFF --------------

exit 0
