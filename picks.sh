#!/bin/bash

source build/envsetup.sh

# telephony: Add state check for LteOnCdma to isGsm and isCdma
#repopick 64932

# kltespr: Add overlay for config_volte_replacement_rat
#repopick 151854

# add a common mkbootimg.mk to quiet "KERNEL IS NOT SEANDROID ENFORCING" warning
repopick 159752

# klte-common: Quiet "KERNEL IS NOT SEANDROID ENFORCING" boot message
repopick 159458
