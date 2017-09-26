#!/bin/bash

source build/envsetup.sh

#for PICK in `curl https://gist.githubusercontent.com/invisiblek/85ebd8a96fba6086dbed3972557eba9e/raw/repopicks-lineage-15.0 | cut -d ' ' -f 1  | egrep "^[0-9]"`; do
#    repopick $PICK
#done

# adb: Restore support for legacy f_adb interface
repopick 185642

# releasetools: don't assert device
repopick 186687

# Allow setting the recovery density separately from the aapt config
repopick 190430
