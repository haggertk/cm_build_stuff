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
  repopick 225618 # hlte-common: Align ril.h to samsung_msm8974-common P libril changes
  repopick 225619 # DO NOT MERGE: hlte-common: Requisite bring-up BS change
fi

# device/samsung/klte-common
if [ -d device/samsung/klte-common ] ; then
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
repopick 223943 # bionic: meh

# build/kati
repopick 225213 # Do not limit threads upon calling legacy GNU make

# build/make
repopick 222733 # core: Disable vendor restrictions
repopick 222760 # Add LOCAL_AIDL_FLAGS
repopick 222742 # build: Use project pathmap for recovery

# build/soong
repopick 224613 # soong: Add LOCAL_AIDL_FLAGS handling

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
repopick 225762 # tinycompress: enable libtinycompress_vendor
repopick 225763 # tinycompress: Use sanitized headers generated from kernel source
repopick 223008 # tinycompress: tinycompress fixes

# frameworks/av
repopick 225530 # camera: Workaround for GCC-compiled HAL3 drivers
repopick 225531 # soundtrigger: fill in default extras from dsp
repopick 225532 # Camera: CameraHardwareInterface changes to support Extended FD
repopick 225533 # camera: Only link and use vendor.qti.hardware.camera.device if specified
repopick 225534 # libstagefright: encoder must exist when source starting
repopick 225535 # Camera: Add extensions to CameraClient
repopick 225536 # Camera: Add support for preview frame fd
repopick 225537 # libstagefright: Add more sample rates for FLAC
repopick 225539 # Camera:CameraService: Added lock on mHIDLMemPoolId in QDataCallback..
repopick 225540 # Camera: CameraHardwareInterface: Releasing mHIDLMemoryMapLock in QdataCallback

# frameworks/base
repopick 229255 # TunerServiceImpl: Add support for Lineage global settings
repopick 229256 # Add support for runtime toggle of navbar
repopick 225682 # Framework: Volume key cursor control
repopick 225683 # PhoneWindowManager: add LineageButtons volumekey hook
repopick 225684 # Long-press power while display is off for torch
repopick 225721 # Reimplement hardware keys custom rebinding
repopick 225722 # Reimplement device hardware wake keys support
repopick 225726 # PhoneWindowManager: Tap volume buttons to answer call
repopick 225727 # PhoneWindowManager: Implement press home to answer call
repopick 225728 # Camera button support
repopick 227820 # PhoneWindowManager: Allow torch and track skip during ambient display
repopick 229254 # SystemUI: handle camera launch gesture from keyhandler
repopick 225693 # SystemUI: add left and right virtual buttons while typing
repopick 225606 # Forward port 'Swap volume buttons' (1/3)
repopick 225702 # Camera: allow camera to use power key as shutter
repopick 226249 # fw/b: Allow customisation of navbar app switch long press action
repopick 225729 # Framework: Forward port Long press back to kill app (2/2)
repopick 225734 # Allow screen unpinning on devices without navbar
repopick 226236 # SystemUI: add navbar button layout inversion tuning
repopick 225859 # storage: Do not notify for volumes on non-removable disks
repopick 226276 # power: Re-introduce custom charging sounds
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
repopick 225545 # Forward port 'Swap volume buttons' (2/3)
repopick 225546 # AppOpsManager: Update with the new ops

# hardware/interfaces
repopick 225506 # Camed HAL extension: Added support in HIDL for Extended FD.
repopick 225507 # camera: Only link and use vendor.qti.hardware.camera.device if specified

# hardware/lineage/interfaces
repopick 223374 # interfaces: Add 2.0 livedisplay interfaces
repopick 223410 # interfaces: Add touch HIDL interface definitions
repopick 223411 # interfaces: Add id HAL definition

# hardware/qcom/audio-caf/msm8974
repopick 223436 # Add -Wno-error to compile with global -Werror.
repopick 227340 # audio: Use normal tinycompress

# hardware/qcom/bt-caf
repopick 226658 # Don't build libbt-hidlclient for OSS builds

# hardware/qcom/display-caf/msm8974
repopick 226481 # display: remove compile time warnings
repopick 226482 # display: Enable clang for all display modules

# hardware/qcom/media-caf/msm8974
repopick 223441 # Add -Wno-error to compile with global -Werror.
repopick 227823 # mm-video-v4l2: Protect buffer access and increase input buffer size

# hardware/qcom/fm
repopick 226683 # Partially revert "FM: QSSI changes"
repopick 226684 # Drop BOARD_HAVE_QCOM_FM flag
repopick 226685 # jni: fix calibration data path for legacy fm_qsoc_patches
repopick 226686 # libfm_jni: Skip loading FM firmware if requested
repopick 226687 # libfm_jni: Do not come here unless QCOM_HARDWARE is in use
repopick 226688 # libfm_jni: Add support for internal antenna hardware
repopick 226689 # libfm_jni: Improve and fix FM jni logs
repopick 226690 # libfm_jni: Confine the firmware-load skipping to the actual loading
repopick 226691 # jni: Skip loading FM firmware if requested
repopick 226692 # jni: Confine the firmware-load skipping to the actual loading
repopick 226693 # Allow library to be used by apps directly
repopick 226694 # Break bootclasspath dependency
repopick 226695 # fmapp2: new launcher icon by LeopardSurd
repopick 226696 # FMRadio : Re-vamp UI
repopick 226697 # Fm : Restore seek arrows
repopick 226698 # Fm : Make default country an overlay
repopick 226699 # FmRadio : Re-add RDS fields to UI
repopick 226700 # Scanned frequencies are saved in ascending ordering
repopick 226701 # FMRadio : Call unregister in onPause
repopick 226702 # FMRadio : Switch file extension to aac
repopick 226703 # FM: Add property to force use internal antenna
repopick 226704 # FM: Cleanup resources
repopick 226705 # FMRadio: add Indonesia
repopick 226706 # New Material icon
repopick 226707 # FM: fixup strings
repopick 226708 # FM2: materialize
repopick 226709 # FM: retune last frequency when resume after call
repopick 226710 # FM: always use overlay default country
repopick 226711 # FM: Store tag num/value in sequence
repopick 226712 # FM: reenable radio text visibility after station info updated
repopick 226713 # FMRadio : Launch station list automatically after scan
repopick 226714 # FM: respect hw.fm.internal_antenna
repopick 226715 # FM: fix mRadioTextScroller usage in transmitter activity
repopick 226716 # Fix status text to reflect when FM is enabled.
repopick 226717 # FM: The collect channel disappear when quit FM
repopick 226718 # FMRadio : Ensure scan state is kept in sync
repopick 226719 # FMRadio : Keep track of scanned frequencies in service
repopick 226720 # FMRadio : Select band based on country
repopick 226721 # FMRadio : cleaned up band selection code
repopick 226722 # FMRadio : improved band selection
repopick 226723 # FMRadio : Localization of band types
repopick 226724 # FMRadio : Fix settings UI bugs
repopick 226725 # FMRadio : Fix headphone icon
repopick 226726 # Fm : Update India bands
repopick 226727 # fmapp2: String improvements
repopick 226728 # fmapp2: Allow value for the default fm recording duration to be overlayed.
repopick 226729 # Convert regional band arrays to string references
repopick 226730 # Revert "Disable libfm_jni"
repopick 226731 # Use BOARD_HAVE_QCOM_FM flag
repopick 226732 # FM: Use some sane colors
repopick 226733 # FM: Fix helium hal build
repopick 226734 # FM: Fix KHz->kHz
repopick 226735 # FM2: Convert FM transmitter notifications to use NotificationChannel
repopick 226736 # FM2: Revamp notifications
repopick 226737 # libfm_jni: Fix strchr implicit char* typecast in ConfFileParser
repopick 226738 # libfm_jni: Add jni core headers dependency
repopick 226739 # Do not link to android.hidl.base@1.0
repopick 226740 # FM: adaptive icon
repopick 226741 # fm: Resolve required dependency qcom.fmradio.xml linkage
repopick 226742 # libfm_jni: Remove unused variables
repopick 226743 # libfm_jni: Resolve fread assignment to condition cast
repopick 223685 # libfm_jni: Resolve FM_DEVICE_PATH R/O open flag
repopick 226744 # libfm_jni: Ignore unused parameters from APIs
repopick 226745 # fm_hci/helium: Exclude from OSS builds
repopick 223678 # libfm_jni: use proper nativehelper headers
repopick 223683 # jni: Remove unused variables
repopick 223684 # jni: Resolve equality comparisons with extraneous parentheses
repopick 226862 # jni: Resolve FM_DEVICE_PATH R/O open flag
repopick 223686 # jni: Ignore unused parameters from APIs
repopick 223687 # jni: Resolve V4L2_CID_AUDIO_MUTE redefinitions
repopick 223692 # jni: Resolve -Wwritable-strings warnings in helium FW library variables
repopick 223688 # fmapp2: Set LOCAL_PRIVATE_PLATFORM_APIS
repopick 224246 # jni: Resolve unused and uninitialized variable errors
repopick 224386 # libfm_jni: Resolve unused and uninitialized variable errors

# lineage-sdk
repopick 225581 # lineage-sdk: Make styles init at system services ready

# packages/apps/Camera2
repopick 224752 # Use mCameraAgentNg for getting camera info when available
repopick 225255 # Camera2: Target API 27
repopick 225256 # Don't attempt to convert degree to orientation enum twice
repopick 225257 # Camera2: Only autofocus before a snap if we are actually in "auto" mode.
repopick 225258 # Camera2: Remove settings preferences only once
repopick 225259 # Camera2: Stop using GPS when going to background
repopick 225260 # Camera: Powerkey shutter (2/2)
repopick 225261 # Camera2: Add option to set max screen brightness
repopick 225262 # Camera2: Remove google help preference
repopick 225263 # Camera2: Fix Undo button behaviour
repopick 225264 # Fix crash if Exif-Tag buffer-length and component-count are both 0
repopick 225265 # Add Storage preference (1/2)

# packages/apps/DeskClock
repopick 225281 # DeskClock: Add back flip and shake actions
repopick 225284 # Provide upgrade path for cm-14.1 -> lineage-15.1
repopick 226131 # DeskClock: Add support of power off alarm feature
repopick 225280 # Make new menu entry to link to cLock widget settings.

# packages/apps/LineageParts
repopick 229305 # ButtonSettings: Adapt for dropped needsNavigationBar method
repopick 226145 # LineageParts: Reenable buttons related settings
repopick 226863 # LineageParts: Drop `Control ringtone volume` setting
repopick 226392 # LineageParts: Set proper default value for charging sounds

# packages/apps/Nfc
repopick 223700 # NFC: Adding new vendor specific interface to NFC Service

# packages/apps/Settings
repopick 225730 # Settings: Add kill app back button toggle
repopick 226142 # Settings: Add developer setting for root access
repopick 226148 # Settings: "Security & location" -> "Security & privacy"
repopick 226150 # Settings: add Trust interface hook
repopick 226151 # Settings: show Trust brading in confirm_lock_password UI
repopick 225570 # Settings: Add LineageParts charging sound settings preference
repopick 225755 # Settings: Hide AOSP theme-related controllers
repopick 225756 # Settings: fix dark style issues
repopick 226154 # fingerprint: Allow devices to configure sensor location
repopick 225858 # storage: Do not allow eject for volumes on non-removable disks
repopick 227120 # Settings: Check interfaces before enabling ADB over network

# packages/apps/SetupWizard
repopick 226626 # LocationSettingsActivity: Send broadcast as user
repopick 229297 # LineageSettingsActivity: Remove useless check for navbar toggle

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
repopick 225921 # overlay: Update list of GSF/GMS activities

# -------------- TOPIC STUFF --------------

repopick -t pie-mode-bits
repopick -t pie-bcm_libbt

exit 0
