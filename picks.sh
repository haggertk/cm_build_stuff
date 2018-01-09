#!/bin/bash

function kpick() {
  repopick $1 || exit 1
}

source build/envsetup.sh

if [ $USER != haggertk ]; then
  d=`pwd`
  cd vendor/samsung || exit 1
  git remote remove haggertk > /dev/null 2>&1
  git remote add haggertk https://github.com/haggertk/proprietary_vendor_samsung.git || exit 1
  git fetch haggertk lineage-15.1 || exit 1
  git checkout haggertk/lineage-15.1 || exit 1
  cd "$d"
fi

# device/samsung/klte-common
kpick 199932 # [DNM] klte-common: import libril from hardware/ril-caf
kpick 199933 # [DNM] klte-common: libril: Add Samsung changes
kpick 199934 # klte-common: libril: Fix RIL_Call structure
kpick 199935 # klte-common: libril: Fix SMS on certain variants
kpick 199936 # klte-common: libril: fix network operator search
kpick 199937 # klte-common: Update RIL_REQUEST_QUERY_AVAILABLE_NETWORKS response prop
kpick 200757 # klte-common: libril: Add workaround for "ring of death" bug
kpick 199941 # klte-common: libril: Fix RIL_UNSOL_NITZ_TIME_RECEIVED Parcel
kpick 200495 # klte-common: Fixup RIL_Call structure
kpick 201182 # klte-common: libril: Get off my back
kpick 199943 # [DNM] klte-common: selinux permissive for O bringup
kpick 199944 # [DNM] klte-common: Kill blur overlay
kpick 199946 # [DNM] klte-common: sepolicy: Rewrite for O
kpick 200643 # klte-common: Move hardware key overlays from fw/b to lineage-sdk
kpick 201051 # klte-common: Move charger service into the charger domain

# external/tinycompress
kpick 199120 # tinycompress: HAXXX: Move libtinycompress_vendor back to Android.mk

# hardware/samsung
kpick 200068 # AdvancedDisplay: cyanogenmod -> lineageos

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

# system/sepolicy
kpick 199664 # sepolicy: Fix up exfat and ntfs support
kpick 198106 # Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
kpick 198107 # Adapt add_service uses for TARGET_HAS_LEGACY_CAMERA_HAL1
kpick 198108 # mediaserver: Allow finding the hal_camera hardware service

# system/core
d=`pwd`
cd system/core || exit 1
curl https://github.com/invisiblek/android_system_core/commit/96c4433e.patch | git am || exit 1
cd "$d" || exit 1

# frameworks/base
kpick 199835 # Runtime toggle of navbar
kpick 198564 # Long-press power while display is off for torch
kpick 199897 # Reimplement hardware keys custom rebinding
kpick 199860 # Reimplement device hardware wake keys support
kpick 199199 # PhoneWindowManager: add LineageButtons volumekey hook
kpick 199200 # Framework: Volume key cursor control
kpick 199203 # Forward port 'Swap volume buttons' (1/3)
kpick 199865 # PhoneWindowManager: Tap volume buttons to answer call
kpick 199906 # PhoneWindowManager: Implement press home to answer call
kpick 199982 # SystemUI: add left and right virtual buttons while typing
kpick 200112 # Framework: Forward port Long press back to kill app (2/2)
kpick 200188 # Allow screen unpinning on devices without navbar
kpick 199947 # PowerManager: Re-integrate button brightness
kpick 200968 # statusbar: Add arguments to shutdown and reboot to allow confirmation
kpick 200969 # SystemUI: Power menu customizations

# frameworks/native
kpick 199204 # Forward port 'Swap volume buttons' (2/3)

# frameworks/av
kpick 198113 # camera/media: Support for legacy camera HALv1
kpick 198114 # libstagefright: Support for legacy camera/encoder buffers
kpick 198116 # CameraService: Fix deadlock in binder death cleanup.

# packages/apps/Settings
kpick 200113 # Settings: Add kill app back button toggle
kpick 199839 # Settings: Add advanced restart switch

# packages/apps/LineageParts
kpick 200069 # LineageParts: Deprecate few button settings
kpick 199198 # LineageParts: Bring up buttons settings
kpick 199948 # LineageParts: Bring up button backlight settings
kpick 201309 # LineageParts: Re-enable PowerMenuActions and adapt to SDK updates

# lineage-sdk
kpick 199196 # lineage-sdk internal: add LineageButtons
kpick 199197 # lineage-sdk: Import device hardware keys configs and constants
kpick 199898 # lineage-sdk: Import device keys custom rebinding configs and add helpers
kpick 200106 # lineage-sdk: Import ActionUtils class
kpick 200114 # lineage-sdk: Add kill app back button configs and strings
kpick 200970 # sdk: Move isAdvancedRebootEnabled to SDK from global access
kpick 201311 # lineage-sdk: Add broadcast action for power menu update

# vendor/lineage
kpick 201336 # soong_config: Add TARGET_HAS_LEGACY_CAMERA_HAL1 variable

exit 0

d=`pwd`
cd frameworks/opt/telephony || exit 1
git remote remove paul > /dev/null 2>&1
git remote add paul https://github.com/randomstuffpaul/android_frameworks_opt_telephony.git || exit 1
git fetch paul lineage-15.1 || exit 1
git checkout paul/lineage-15.1 || exit 1
cd "$d"

exit 0

# frameworks/opt/telephony
kpick 200781 # Telephony: Enable data call on CSIM.
kpick 200783 # Support Fetching IMSI MCC and MNC for RuimRecords.
kpick 200784 # Get default from CdmaSubscriptionSourceManager
kpick 200785 # Telephony: Reduce back to back same APN activation delay.
kpick 200786 # Fix the roaming searching text display in standby screen
kpick 200787 # Telephony: Fix RUIM app mcc/mnc issue.
kpick 200788 # Fix copying SMS into RUIM with failure
kpick 200793 # Mms: Add the retrieve conf type support in MMS PDU composer.
kpick 200797 # PhoneFactory: fix creating a cdma phone type
kpick 200796 # Telephony: Enable NV based CDMA data call.
kpick 200798 # For NV-based devices like CDMA only devices, ignore ICC Card status change EVENT.
kpick 200799 # Send EVENT_NV_READY to GsmCdmaPhone
kpick 200800 # Add dummy SUB record in CDMA NV mode
kpick 200801 # Update carrier services on EVENT_NV_READY
kpick 200802 # GsmCdmaPhone: Return dummy ICCID serial for NV sub
kpick 200803 # GsmCdmaPhone: Fix GSM SIM card ICCID on NV sub CDMA devices
kpick 200804 # Create cdma dummy apns.
