#!/bin/bash

source build/envsetup.sh

for PICK in `curl https://gist.githubusercontent.com/invisiblek/85ebd8a96fba6086dbed3972557eba9e/raw/repopicks-lineage-15.0 | cut -d ' ' -f 1  | egrep "^[0-9]"`; do
    repopick $PICK
done

# Add roomservice
repopick 185913

# dtbhtool: Use libfdt from external/dtc
repopick 186324

repopick -t releasetools-scripts

# releasetools: ota_from_target_files: add FullOTA_PostValidate
repopick 187374
