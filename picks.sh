#!/bin/bash

source build/envsetup.sh

# av: Add support for CameraSource as metadata type
repopick 167485

# Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
repopick 167484

# SysUI: Use VectorDrawable's for rendering battery
# NOTE: Pretty close to done enough for me, I like the text-only option
repopick 167464

# msm8974-common: Add vsync phase offset
# NOTE: Not absolutely required
repopick 167497

# klte-common: Enable legacy mediaserver
# NOTE: Depends on 167485, 167484
repopick 167511

# [DO NOT MERGE] Revert "klte: Enable blur"
# NOTE: Temp until 167370 is merged, then drop
repopick 167512
