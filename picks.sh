#!/bin/bash

source build/envsetup.sh

repopick -t rebrand

# telephony: Add state check for LteOnCdma to isGsm and isCdma
#repopick 64932

# Telecomm: Set MSIM audio params using the proper sub IDs
repopick 155020

# kltespr: Add overlay for config_volte_replacement_rat
#repopick 151854

# sensors: Allow opting out of default batch size
repopick 156735

# klte-common: Fix rotation sensor
repopick 156738
