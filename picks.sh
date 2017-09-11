#!/bin/bash

source build/envsetup.sh

# Burn-In Protection
repopick 187647 187648 187649

# aenc-aac: bounds checking (CVE-2017-8278)
repopick 188638
