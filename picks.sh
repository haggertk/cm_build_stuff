#!/bin/bash

source build/envsetup.sh

# telephony: Add state check for LteOnCdma to isGsm and isCdma
#repopick 64932

# kltespr: Add overlay for config_volte_replacement_rat
#repopick 151854

# klte-common: Squashed set of TWRP support patches
repopick 159705

# NfcNci: make T3T/Nfc-F HCE optional
repopick 161917

# klte-common: Disable T3T/Nfc-F HCE support
repopick 161932

# AVRCP: Add null pointer check
repopick 162121
