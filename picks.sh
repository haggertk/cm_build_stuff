#!/bin/bash

set -e

function privpick() {
  git -C $1 fetch github $2
  git -C $1 cherry-pick FETCH_HEAD
}

source build/envsetup.sh

# -------------- DEVICE STUFF --------------

# I'm holding these on a local branch, so I don't need to pick them.
# This will be revisited if anyone else starts helping with bring-up
# of these devices.
if [ $USER != haggertk ]; then

# device/samsung/hlte-common
if [ -d device/samsung/hlte-common ] ; then
  repopick 231030 # hlte-common: Set SDK API level for rild
  repopick 225618 # hlte-common: Align ril.h to samsung_msm8974-common P libril changes
  repopick 225619 # DO NOT MERGE: hlte-common: Requisite bring-up BS change
fi

# device/samsung/klte-common
if [ -d device/samsung/klte-common ] ; then
  repopick 231029 # klte-common: Set SDK API level for rild
  repopick 225192 # klte-common: Align ril.h to samsung_msm8974-common P libril changes
  repopick 224917 # DO NOT MERGE: klte-common: Requisite bring-up BS change
fi

# device/samsung/msm8974-common
if [ -d device/samsung/msm8974-common ] ; then
  repopick 228677 # msm8974-common: Make the external camera provider ignore internal cameras
  repopick 225466 # msm8974-common: libril: Remove LOCAL_CLANG
  repopick 225467 # msm8974-common: libril: Fix Const-Correctness for RIL_RadioFunctions
  repopick 225468 # msm8974-common: libril: Remove unused code
  repopick 225469 # msm8974-common: libril: Fix double freeing of memory in SAP service and add null-checks.
  repopick 225470 # msm8974-common: libril: Store the system time when NITZ is received.
  repopick 225471 # msm8974-common: libril: Add DISABLE_RILD_OEM_HOOK.
  repopick 225472 # msm8974-common: libril:  Change rild initial sequence to guarantee non-null function pointer before rild register its hidl service
  repopick 225473 # msm8974-common: libril: Add SIM_ABSENT error
  repopick 225759 # msm8974-common: libril: Replace strncpy with strlcpy.
  repopick 225760 # msm8974-common: libril: FR51015: Tuning of Binder buffer for rild.
  repopick 224916 # DO NOT MERGE: msm8974-common: sepolicy: Just make it build
fi

fi # [ $USER != haggertk ]

# -------------- PLATFORM STUFF --------------

# bionic
repopick 229488 # Revert "linker: Make platform text relocations denial optional"
repopick 230099 # Actually restore pre-P mutex behavior
repopick 230762 # bionic: Fix more mutex breakage

# build/kati
repopick 225213 # Do not limit threads upon calling legacy GNU make

# build/make
repopick 222733 # core: Disable vendor restrictions
repopick 222760 # Add LOCAL_AIDL_FLAGS
repopick 222742 # build: Use project pathmap for recovery
repopick 229491 # build: Automatically replace old-style kernel header includes with new header lib

# build/soong
repopick 224613 # soong: Add LOCAL_AIDL_FLAGS handling
repopick 229411 # soong sbox: Add option to allow copying all generated output

# dalvik
repopick 225475 # dexdeps: Add option for --include-lineage-classes.
repopick 225476 # dexdeps: Ignore static initializers on analysis.

# device/qcom/sepolicy
repopick 228566 # qcom: Label vendor files with (vendor|system/vendor) instead of vendor
repopick 228569 # Use set_prop() macro for property sets
repopick 228570 # sepolicy: Allow wcnss_service to set wlan.driver properties
repopick 228571 # sepolicy: allow system_server to read alarm boot prop
repopick 228572 # sepolicy: Allow system_server to 'read' qti_debugfs
repopick 228573 # sepolicy: Add libsdm-disp-vndapis and libsdmutils to SP-HALs
repopick 228574 # sepolicy: Allow thermal-engine to read sysfs_uio[_file]
repopick 228575 # sepolicy: Add libcryptfs_hw to SP HALs
repopick 228576 # sepolicy: Label mpctl_socket as data_file_type
repopick 228578 # sepolicy: rules to allow camera daemon access to app buffer
repopick 228580 # hal_gnss_default: Do not log udp socket failures
repopick 228582 # sepolicy: qti_init_shell needs to read dir too
repopick 228583 # sepolicy: allow vold to read persist dirs
repopick 228584 # sepolicy: Fix video4linux "name" node labeling
repopick 228585 # sepolicy: Allow mm-qcamerad to access v4L "name" node
repopick 228586 # common: Fix labelling of lcd-backlight
repopick 228587 # sepolicy: Allow perf HAL to set freq props

# external/tinycompress
repopick 229414 # tinycompress: Use generated kernel headers

# frameworks/base
repopick 226236 # SystemUI: add navbar button layout inversion tuning
repopick 224844 # lockscreen: Add option for showing unlock screen directly
repopick 225754 # SystemUI: Berry styles
repopick 225582 # [TEMP]: Revert "OMS: harden permission checks"
repopick 227108 # SystemUI: Fix several issues in the ADB over Network tile
repopick 226615 # NavigationBarView: Avoid NPE before mPanelView is created
repopick 227821 # GlobalScreenshot: Fix screenshot not saved when appending appname with some languages
repopick 228405 # Forward port CM Screen Security settings (1/2)
repopick 229230 # SystemUI: allow the power menu to be relocated
repopick 224446 # SystemUI: Make tablets great again
repopick 224513 # SystemUI: Disable config_keyguardUserSwitcher on sw600dp

# frameworks/native
repopick 224443 # libbinder: Don't log call trace when waiting for vendor service on non-eng builds
repopick 225546 # AppOpsManager: Update with the new ops

# hardware/interfaces
repopick 225506 # Camed HAL extension: Added support in HIDL for Extended FD.
repopick 225507 # camera: Only link and use vendor.qti.hardware.camera.device if specified

# hardware/lineage/interfaces
repopick 223374 # interfaces: Add 2.0 livedisplay interfaces
repopick 223410 # interfaces: Add touch HIDL interface definitions
repopick 223411 # interfaces: Add id HAL definition

# hardware/qcom/audio
repopick 230749 # audio: Use generated kernel headers

# hardware/qcom/audio-caf/msm8974
repopick 223436 # Add -Wno-error to compile with global -Werror.

# hardware/qcom/bt-caf
repopick 226658 # Don't build libbt-hidlclient for OSS builds

# hardware/qcom/display-caf/msm8974
repopick 226481 # display: remove compile time warnings
repopick 226482 # display: Enable clang for all display modules

# hardware/qcom/media
repopick 230750 # media: Use generated kernel headers

# hardware/qcom/media-caf/msm8974
repopick 223441 # Add -Wno-error to compile with global -Werror.
repopick 227823 # mm-video-v4l2: Protect buffer access and increase input buffer size

# hardware/qcom/fm
repopick 226731 # Use BOARD_HAVE_QCOM_FM flag
repopick 226745 # fm_hci/helium: Exclude from OSS builds
repopick 226683 # Bring back libfm_jni for devices using AOSP FM app
repopick 226685 # jni/libfm_jni: fix calibration data path for legacy fm_qsoc_patches
repopick 226692 # jni/libfm_jni: Skip loading FM firmware if requested
repopick 226687 # libfm_jni: Do not come here unless QCOM_HARDWARE is in use
repopick 226688 # libfm_jni: Add support for internal antenna hardware
repopick 226689 # libfm_jni: Improve and fix FM jni logs
repopick 226737 # libfm_jni: Fix strchr implicit char* typecast in ConfFileParser
repopick 226738 # libfm_jni: Add jni core headers dependency
repopick 226742 # jni/libfm_jni: Remove unused variables
repopick 226743 # libfm_jni: Resolve fread assignment to condition cast
repopick 223685 # jni/libfm_jni: Resolve FM_DEVICE_PATH R/O open flag
repopick 226744 # jni/libfm_jni: Ignore unused parameters from APIs
repopick 223678 # libfm_jni: use proper nativehelper headers
repopick 223684 # jni: Resolve equality comparisons with extraneous parentheses
repopick 223687 # jni: Resolve V4L2_CID_AUDIO_MUTE redefinitions
repopick 223692 # jni: Resolve -Wwritable-strings warnings in helium FW library variables
repopick 226741 # Allow library to be used by apps directly
repopick 226694 # FM: Break bootclasspath dependency
repopick 226696 # FM: Re-vamp UI
repopick 226697 # FM: Restore seek arrows
repopick 226710 # FM: Make default country an overlay
repopick 226699 # FM: Re-add RDS fields to UI
repopick 226700 # FM: Scanned frequencies are saved in ascending ordering
repopick 226701 # FM: Call unregister in onPause
repopick 226702 # FM: Switch file extension to aac
repopick 226714 # FM: Add property to force use internal antenna
repopick 226727 # FM: Cleanup resources
repopick 226705 # FM: add Indonesia
repopick 226732 # FM: materialize
repopick 226709 # FM: retune last frequency when resume after call
repopick 226711 # FM: Store tag num/value in sequence
repopick 226712 # FM: reenable radio text visibility after station info updated
repopick 226713 # FM: Launch station list automatically after scan
repopick 226715 # FM: fix mRadioTextScroller usage in transmitter activity
repopick 226716 # FM: Fix status text to reflect when FM is enabled.
repopick 226717 # FM: The collect channel disappear when quit FM
repopick 226718 # FM: Ensure scan state is kept in sync
repopick 226719 # FM: Keep track of scanned frequencies in service
repopick 226721 # FM: Select band based on country
repopick 226722 # FM: improved band selection
repopick 226723 # FM: Localization of band types
repopick 226724 # FM: Fix settings UI bugs
repopick 226725 # FM: Fix headphone icon
repopick 226726 # FM: Update India bands
repopick 226729 # FM: Convert regional band arrays to string references
repopick 226734 # FM: Fix KHz->kHz
repopick 226735 # FM: Convert FM transmitter notifications to use NotificationChannel
repopick 226736 # FM: Revamp notifications
repopick 226740 # FM: adaptive icon

# lineage-sdk
repopick 225581 # lineage-sdk: Make styles init at system services ready

# packages/apps/Camera2
repopick 224752 # Use mCameraAgentNg for getting camera info when available
repopick 225265 # Add Storage preference (1/2)

# packages/apps/DeskClock
repopick 226131 # DeskClock: Add support of power off alarm feature

# packages/apps/LineageParts
repopick 226863 # LineageParts: Drop `Control ringtone volume` setting

# packages/apps/Settings
repopick 226142 # Settings: Add developer setting for root access
repopick 226148 # Settings: "Security & location" -> "Security & privacy"
repopick 226150 # Settings: add Trust interface hook
repopick 226151 # Settings: show Trust brading in confirm_lock_password UI
repopick 225755 # Settings: Hide AOSP theme-related controllers
repopick 225756 # Settings: fix dark style issues
repopick 226154 # fingerprint: Allow devices to configure sensor location
repopick 227120 # Settings: Check interfaces before enabling ADB over network
repopick 228403 # Settings: forward port lock pattern grid size (2/2)
repopick 228404 # Forward port pattern visibility settings (2/2)

# system/bt
repopick 225422 # Bluetooth: Read BLE vendor capability to proceed on Secure conn
repopick 223945 # Prevent abort in case of command timeout
repopick 225423 # Add support to force disable enhanced sco commands

# system/core
privpick system/core refs/changes/19/206119/2 # init: I hate safety net

# system/sepolicy
repopick 223746 # Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
repopick 223748 # Build sepolicy tools with Android.bp.

# vendor/lineage
repopick 229506 # Revert "soong_config: Add TARGET_NEEDS_PLATFORM_TEXT_RELOCATIONS"
repopick 225921 # overlay: Update list of GSF/GMS activities
repopick 231218 # kernel: Correct CROSS_COMPILE_ARM32 toolchain
repopick 229508 # lineage: Move kernel variable configuration to BoardConfigKernel
repopick 229412 # vendor/lineage: Add soong generator module type
repopick 229415 # lineage: Dynamically generate kernel headers using lineage generator
repopick 229505 # vendor/lineage: Remove kernel.mk headers generation
repopick 231219 # kernel: Remove deprecated flag errors
repopick 231220 # kernel: Remove kernel{x}config

# vendor/qcom/opensource/cryptfs_hw
repopick 230271 # cryptfs_hw: Use generated kernel headers

# -------------- TOPIC STUFF --------------

repopick -t pie-mode-bits
repopick -t pie-bcm_libbt

exit 0
