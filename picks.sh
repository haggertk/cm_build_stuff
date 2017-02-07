#!/bin/bash

source build/envsetup.sh

# telephony: Add state check for LteOnCdma to isGsm and isCdma
#repopick 64932

# kltespr: Add overlay for config_volte_replacement_rat
#repopick 151854

# klte-common: Squashed set of TWRP support patches
repopick 159705
