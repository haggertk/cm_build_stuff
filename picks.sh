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
kpick 202457 # klte-common: HAXX: Fix seeming RIL start race condition
kpick 199946 # [DNM] klte-common: sepolicy: Rewrite for O

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
kpick 201552 # Squashed import of superuser SELinux policies
kpick 201582 # sepolicy: adapt sudaemon policy for O

# device/qcom/sepolicy
kpick 199557 # legacy: add back perfd sepolicy
kpick 202379 # legacy: add back radio rules
kpick 202381 # legacy: add back rules for non-treble devices
kpick 202382 # legacy: allow rmt_storage sys_admin capability
kpick 202383 # legacy: let rfs_access do msm ipc ioctls
kpick 202384 # legacy: label old hardcoded data paths
kpick 202385 # legacy: label old msm_irqbalance prop
kpick 202386 # legacy: add back ipacm rules
kpick 202387 # legacy: add back imscm support into ims
kpick 202388 # legacy: allow rild to access radio data files
kpick 202389 # legacy: Fix labeling the thermal sockets
kpick 202390 # legacy: let audioserver connect to thermal engine sockets
kpick 202391 # legacy: label per_mgr as a binder service
kpick 198303 # sepolicy: Add sysfs labels for devices using 'soc.0'
kpick 202824 # legacy: Readd support for old perfd socket
kpick 202825 # legacy: Add back old fdAlbum rule
kpick 202826 # sepolicy: Label boot/recovery/cache/system partitions
kpick 202827 # legacy: Label old UIO sysfs
kpick 202828 # legacy: Allow qmuxd access diag
kpick 202829 # legacy: Label old SSR sysfs
kpick 202830 # legacy: Add back legacy sensors rules
kpick 202831 # legacy: Label old kgsl sysfs nodes
kpick 202995 # legacy: Address mpdecision denials
kpick 198141 # Use set_prop() macro for property sets

# system/sepolicy
kpick 199664 # sepolicy: Fix up exfat and ntfs support
kpick 198106 # Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
kpick 198107 # Adapt add_service uses for TARGET_HAS_LEGACY_CAMERA_HAL1
kpick 198108 # mediaserver: Allow finding the hal_camera hardware service
kpick 201553 # sepolicy: We need to declare before referencing
kpick 201583 # sepolicy: Allow su by apps on userdebug_or_eng
kpick 201584 # sepolicy: update policies for sudaemon on O
kpick 201732 # sepilocy: add sudaemon to ignore list

# system/core
kpick 202849 # Update permissions to the superuser binary
d=`pwd`
cd system/core || exit 1
git remote remove blek > /dev/null 2>&1
git remote add blek https://github.com/invisiblek/android_system_core.git || exit 1
git fetch blek lineage-15.1_safetynet || exit 1
git cherry-pick 96c4433e || exit 1 # init: I hate safety net
cd "$d" || exit 1

# frameworks/base
kpick 200968 # statusbar: Add arguments to shutdown and reboot to allow confirmation
kpick 200969 # SystemUI: Power menu customizations
kpick 201879 # frameworks: Privacy Guard for O
kpick 199947 # PowerManager: Re-integrate button brightness

# frameworks/av
kpick 198113 # camera/media: Support for legacy camera HALv1
kpick 198114 # libstagefright: Support for legacy camera/encoder buffers
kpick 198116 # CameraService: Fix deadlock in binder death cleanup.

# frameworks/native
kpick 201530 # AppOpsManager: Update with the new ops

# packages/apps/Settings
kpick 199839 # Settings: Add advanced restart switch
kpick 201529 # Settings: Privacy Guard
kpick 201531 # Settings: Add developer setting for root access


# packages/apps/LineageParts
kpick 201309 # LineageParts: Re-enable PowerMenuActions and adapt to SDK updates
kpick 201528 # PrivacyGuard: Bring up and inject into Settings
kpick 199948 # LineageParts: Bring up button backlight settings

# lineage-sdk
kpick 200970 # lineage-sdk: Import power menu related classes

# vendor/lineage
kpick 201336 # soong_config: Add TARGET_HAS_LEGACY_CAMERA_HAL1 variable

# Dark-theme - putting this last because need to manually-resolve change
kpick 201327 # overlays: Overlay Settings for Dark UI [1/2]
kpick 201329 # SysuiDarkThemeOverlay: Initial Dark UI changes
kpick 201330 # overlays: Overlay Settings for Dark UI [2/2]
kpick 200153 # StatusBar: Add dark theme toggle [1/3]
kpick 200154 # LineageSettings: Add dark theme toggle [2/3]
kpick 200155 # Settings: Add toggle for dark theme [3/3]

exit 0
