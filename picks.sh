#!/bin/bash

source build/envsetup.sh

# libstagefright: Support for legacy camera/encoder buffers
repopick 168923

# camera/media: Support for legacy camera HALv1
repopick 168929

# Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
repopick 167484

# SysUI: Use VectorDrawable's for rendering battery
# NOTE: Pretty close to done enough for me, I like the text-only option
repopick 167464

# klte-common: Enable legacy mediaserver
# NOTE: Depends on 168923, 168929, 167484
repopick 167511

# [DO NOT MERGE] Revert "klte: Enable blur"
# NOTE: Temp until 167370 is merged, then drop
repopick 167512

# Revert "Revert "klte-common: enable sdcardfs""
repopick 168974
