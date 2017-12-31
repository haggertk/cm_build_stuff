#!/bin/bash

function kpick() {
  repopick $1 || exit 1
}

source build/envsetup.sh

CAF_HALS="audio display media"
for hal in $CAF_HALS; do
  d=`pwd`
  cd hardware/qcom/${hal}-caf/msm8974 || exit 1
  git remote remove bgcngm > /dev/null 2>&1
  git remote add bgcngm https://github.com/bgcngm/android_hardware_qcom_${hal}.git || exit 1
  git fetch bgcngm staging/lineage-15.1-caf-8974-rebase-LA.BF.1.1.3_rb1.15  || exit 1
  git checkout bgcngm/staging/lineage-15.1-caf-8974-rebase-LA.BF.1.1.3_rb1.15 || exit 1
  cd $d
done

kpick 199120 # tinycompress: HAXXX: Move libtinycompress_vendor back to Android.mk

# device/lineage/sepolicy
kpick 198594 # sepolicy: qcom: Import bluetooth_loader/hci_attach rules
kpick 199347 # sepolicy: Set the context for fsck.exfat/ntfs to fsck_exec
kpick 199348 # sepolicy: Add domain for mkfs binaries
kpick 199349 # sepolicy: label exfat and ntfs mkfs executables
kpick 199350 # sepolicy: treat fuseblk as sdcard_external
kpick 199351 # sepolicy: fix denials for external storage
kpick 199352 # sepolicy: Allow vold to `getattr` on mkfs_exec
kpick 199353 # sepolicy: allow vold to mount fuse-based sdcard
kpick 199515 # sepolicy: Add policy for sysinit
kpick 199516 # sepolicy: allow userinit to set its property
kpick 199517 # sepolicy: Permissions for userinit
kpick 199518 # sepolicy: Fix sysinit denials
kpick 199571 # sepolicy: Move fingerprint 2.0 service out of private sepolicy
kpick 199572 # sepolicy: SELinux policy for persistent properties API

# device/qcom/sepolicy
kpick 198620 # sepolicy: Let keystore load firmware
kpick 198703 # Revert "sepolicy: Allow platform app to find nfc service"
kpick 198707 # sepolicy: Include legacy rild policies
kpick 198141 # Use set_prop() macro for property sets
kpick 198303 # sepolicy: Add sysfs labels for devices using 'soc.0'
kpick 199557 # sepolicy: Readd perfd policies
kpick 199558 # sepolicy: Allow system_app to connect to time_daemon socket
kpick 199559 # sepolicy: Allow dataservice_app to read/write to IPA device
kpick 199560 # sepolicy: Allow bluetooth to connect to wcnss_filter socket
kpick 199562 # sepolicy: Allow netmgrd to communicate with netd
kpick 199562 # sepolicy: Allow netmgrd to communicate with netd
kpick 199564 # sepolicy: Allow energyawareness to read sysfs files
kpick 199565 # sepolicy: Label pre-O location data and socket file paths
kpick 199554 # sepolicy: Add /data/vendor/time label for old oreo blobs
kpick 199600 # sepolicy: Allow 'sys_admin' capability for rmt_storage

# hardware/broadcom/libbt
kpick 200115 # libbt: Add btlock support
kpick 200116 # libbt: Add prepatch support
kpick 200117 # libbt: Add support for using two stop bits
kpick 200118 # libbt-vendor: add support for samsung bluetooth
kpick 200119 # libbt-vendor: Add support for Samsung wisol flavor
kpick 200121 # libbt-vendor: Fix Samsung patchfile detection.
kpick 200122 # Avoid an annoying bug that only hits BCM chips running at less than 3MBps
kpick 200123 # libbt-vendor: add support for Samsung semco
kpick 200124 # Broadcom BT: Add support fm/bt via v4l2.
kpick 200126 # libbt: Import CID_PATH from samsung_macloader.h
kpick 200127 # libbt: Only allow upio_start_stop_timer on 32bit arm

# hardware/samsung
kpick 200133 # macloader: Stop allowing G and O write perms to the cidfile

# system/sepolicy
kpick 199664 # sepolicy: Fix up exfat and ntfs support


