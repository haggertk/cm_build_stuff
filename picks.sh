#!/bin/bash

source build/envsetup.sh

# Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
repopick 167484

# SysUI: Use VectorDrawable's for rendering battery
# NOTE: Pretty close to done enough for me, I like the text-only option
repopick 167464

# klte-common: Enable legacy mediaserver
# NOTE: Depends on 167484
repopick 167511

# [DO NOT MERGE] Revert "klte: Enable blur"
# NOTE: Temp until 167370 is merged, then drop
repopick 167512

# klte-common: Add buildable libpn547_fw
repopick 169338

# klte: nfc: Update configs and build
repopick 169331

# klte: Use source-built libpn547 NFC firmware blob
repopick 169353
