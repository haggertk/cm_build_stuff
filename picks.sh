#!/bin/bash

set -e

function privpick() {
  git -C $1 fetch github $2
  git -C $1 cherry-pick FETCH_HEAD
}

source build/envsetup.sh

# -------------- DEVICE STUFF --------------
# maintained but currently commented-out because on a local branch

# device/samsung/hlte-common
#repopick 225612 # hlte-common: wlan: Update supplicant services for new calling sequence
#repopick 225613 # hlte-common: wifi_supplicant: deprecate entropy.bin
#repopick 225614 # hlte-common: wpa_supplicant: Move control sockets to /data/vendor
#repopick 225615 # hlte-common: Don't start supplicant with interfaces
#repopick 225616 # hlte-common: wpa_supplicant(hidl): Add support for starting HAL lazily
#repopick 225617 # hlte-common: Add p2p_no_group_iface=1 to p2p_supplicant_overlay
#repopick 225866 # hlte-common: Update prefixes for audio system properties
#repopick 225618 # hlte-common: Align ril.h to samsung_msm8974-common P libril changes
#repopick 225619 # DO NOT MERGE: hlte-common: Requisite bring-up BS change

# device/samsung/klte-common
#repopick 225186 # klte-common: wlan: Update supplicant services for new calling sequence
#repopick 225187 # klte-common: wifi_supplicant: deprecate entropy.bin
#repopick 225188 # klte-common: wpa_supplicant: Move control sockets to /data/vendor
#repopick 225189 # klte-common: Don't start supplicant with interfaces
#repopick 225190 # klte-common: wpa_supplicant(hidl): Add support for starting HAL lazily
#repopick 225191 # klte-common: Add p2p_no_group_iface=1 to p2p_supplicant_overlay
#repopick 225761 # klte-common: Update prefixes for audio system properties
#repopick 225192 # klte-common: Align ril.h to samsung_msm8974-common P libril changes
#repopick 224917 # DO NOT MERGE: klte-common: Requisite bring-up BS change

# device/samsung/msm8974-common
#repopick 224851 # msm8974-common: config.fs: Add 'VENDOR' prefix to AIDs
#repopick 225249 # msm8974-common: Uprev Wi-Fi HAL to 1.2
#repopick 225250 # msm8974-common: Uprev to supplicant 1.1
#repopick 225251 # msm8974-common: Add hostapd HIDL interface
#repopick 225620 # msm8974-common: Switch to common basic USB HAL
#repopick 226070 # msm8974-common: Allow additional gralloc 1.0 buffer usage bits
#repopick 225466 # msm8974-common: libril: Remove LOCAL_CLANG
#repopick 225467 # msm8974-common: libril: Fix Const-Correctness for RIL_RadioFunctions
#repopick 225468 # msm8974-common: libril: Remove unused code
#repopick 225469 # msm8974-common: libril: Fix double freeing of memory in SAP service and add null-checks.
#repopick 225470 # msm8974-common: libril: Store the system time when NITZ is received.
#repopick 225471 # msm8974-common: libril: Add DISABLE_RILD_OEM_HOOK.
#repopick 225472 # msm8974-common: libril:  Change rild initial sequence to guarantee non-null function pointer before rild register its hidl service
#repopick 225473 # msm8974-common: libril: Add SIM_ABSENT error
#repopick 225759 # msm8974-common: libril: Replace strncpy with strlcpy.
#repopick 225760 # msm8974-common: libril: FR51015: Tuning of Binder buffer for rild.
#repopick 224916 # DO NOT MERGE: msm8974-common: sepolicy: Just make it build

# -------------- PLATFORM STUFF --------------

# bionic
repopick 225940 # Allow whitelisted processes to use destroyed mutex
repopick 223943 # bionic: meh

# build/make
repopick 222733 # core: Disable vendor restrictions
repopick 222760 # Add LOCAL_AIDL_FLAGS
repopick 222742 # build: Use project pathmap for recovery

# build/soong
repopick 224613 # soong: Add LOCAL_AIDL_FLAGS handling

# dalvik
repopick 225475 # dexdeps: Add option for --include-lineage-classes.
repopick 225476 # dexdeps: Ignore static initializers on analysis.

# device/lineage/sepolicy
repopick 225115 # common: Label common basic USB HAL

# device/qcom/sepolicy
repopick 224767 # sepol: Remove duplicated hal_vehicle attribute
repopick 224768 # sepol: hostapd is now hal_wifi_hostapd
repopick 225036 # common: Remove duplicate definition of hostapd data files

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
repopick 225685 # frameworks: Power menu customizations
repopick 225590 # Reintroduce button-backlight (and respective inactivity timeout)
repopick 225591 # power: Disable keyboard/button lights while dozing/dreaming
repopick 225592 # PowerManager: Re-integrate button brightness
repopick 225593 # PowerManager: Add proximity check on wake
repopick 225598 # PowerManagerService: Allow to light up buttons only when pressed
repopick 225599 # PowerManager: Allow to distinguish different keypresses
repopick 225600 # PowerManagerService: Wake on plug (1/2)
repopick 225983 # Runtime toggle of navbar
eepopick 225650 # Configurable 0, 90, 180 and 270 degree rotation
repopick 226252 # Add rules for non platform apps that use hidden APIs
repopick 225799 # SystemUI: fix toggling lockscreen rotation [1/3]
repopick 226133 # Port ADB over network and ability to hide the notification
repopick 225651 # SystemUI: enable NFC tile
repopick 225652 # SystemUI: add caffeine qs tile
repopick 225653 # SystemUI: Add heads up tile
repopick 225654 # QS: add Sync tile
repopick 225655 # Added show volume panel tile to QS
repopick 225656 # SystemUI: ADB over network tile
repopick 225657 # SystemUI: AmbientDisplay tile
repopick 225658 # SystemUI: USB Tether tile
repopick 225659 # SystemUI: LiveDisplay tile
repopick 225661 # SystemUI: Reading mode tile
repopick 225679 # Keyguard: Add option to scramble pin layout when unlocking (2/2).
repopick 225680 # SystemUI: Allow overlaying max notification icons
repopick 225682 # Framework: Volume key cursor control
repopick 225683 # PhoneWindowManager: add LineageButtons volumekey hook
repopick 225684 # Long-press power while display is off for torch
repopick 225691 # SystemUI: Don't vibrate on touchscreen camera gesture
repopick 225692 # framework: move device key handler logic, fix gesture camera launch
repopick 225693 # SystemUI: add left and right virtual buttons while typing
repopick 225606 # Forward port 'Swap volume buttons' (1/3)
repopick 225702 # Camera: allow camera to use power key as shutter
repopick 225721 # Reimplement hardware keys custom rebinding
repopick 226249 # fw/b: Allow customisation of navbar app switch long press action
repopick 225722 # Reimplement device hardware wake keys support
repopick 225726 # PhoneWindowManager: Tap volume buttons to answer call
repopick 225727 # PhoneWindowManager: Implement press home to answer call
repopick 225728 # Camera button support
repopick 225729 # Framework: Forward port Long press back to kill app (2/2)
repopick 225734 # Allow screen unpinning on devices without navbar
repopick 225754 # SystemUI: Berry styles
repopick 225766 # Add an option to force pre-O apps to use full screen aspect ratio
repopick 225861 # [2/3] NetworkManagement : Add ability to restrict app data/wifi usage
repopick 225919 # PackageManager: allow build-time disabling of components
repopick 226236 # SystemUI: add navbar button layout inversion tuning
repopick 225859 # storage: Do not notify for volumes on non-removable disks
repopick 226081 # fingerprint: notify client when cancelling succeeded
repopick 226083 # Keyguard: Allow disabling fingerprint wake-and-unlock
repopick 226084 # fingerprint: handle PerformanceStats NULL pointers
repopick 226276 # power: Re-introduce custom charging sounds
repopick 224844 # lockscreen: Add option for showing unlock screen directly
repopick 225582 # [TEMP]: Revert "OMS: harden permission checks"
repopick 224446 # SystemUI: Make tablets great again
repopick 224513 # SystemUI: Disable config_keyguardUserSwitcher on sw600dp

# frameworks/native
repopick 224443 # libbinder: Don't log call trace when waiting for vendor service on non-eng builds
repopick 225545 # Forward port 'Swap volume buttons' (2/3)
repopick 225546 # AppOpsManager: Update with the new ops
repopick 225547 # PowerManager.h: Define USER_ACTIVITY_FLAG values
repopick 225548 # InputDispatcher: On keypress, deliver keycode to pokeUserActivity
repopick 225827 # libui: Allow extension of valid gralloc 1.0 buffer usage bits

# frameworks/opt/telephony
repopick 223774 # telephony: Squashed support for simactivation feature

# hardware/interfaces
repopick 225506 # Camed HAL extension: Added support in HIDL for Extended FD.
repopick 225507 # camera: Only link and use vendor.qti.hardware.camera.device if specified

# hardware/libhardware
repopick 223097 # hardware/libhw: Add display_defs.h to declare custom enums/flags

# hardware/lineage/interfaces
repopick 223906 # biometrics: fingerprint: add locking to default impl
repopick 223907 # Use -Werror in hardware/interfaces/biometrics/fingerprint
repopick 223908 # fpc: keep fpc in system-background
repopick 224525 # lineage/interfaces: Add basic USB HAL that reports no status change
repopick 223374 # interfaces: Add 2.0 livedisplay interfaces
repopick 223410 # interfaces: Add touch HIDL interface definitions
repopick 223411 # interfaces: Add id HAL definition

# hardware/qcom/audio-caf/msm8974
repopick 223436 # Add -Wno-error to compile with global -Werror.
repopick 225193 # hal: Update prefixes for audio system properties

# hardware/qcom/display-caf/msm8974
repopick 223434 # Include what we use.
repopick 223435 # Add -Wno-error to compile with global -Werror.

# hardware/qcom/display-caf/msm8998
repopick 225757 # display: Define soong namespace

# hardware/qcom/media-caf/msm8974
repopick 223441 # Add -Wno-error to compile with global -Werror.

# hardware/qcom/power
repopick 223892 # power: Add power hint to set profile
repopick 223890 # Revert "power: Depend on vendor lineage power HAL"

# hardware/qcom/fm
repopick 223678 # libfm_jni: use proper nativehelper headers
repopick 223683 # jni: Remove unused variables
repopick 223684 # jni: Resolve equality comparisons with extraneous parentheses
repopick 223685 # jni: Resolve FM_DEVICE_PATH R/O open flag
repopick 223686 # jni: Ignore unused parameters from APIs
repopick 223687 # jni: Resolve V4L2_CID_AUDIO_MUTE redefinitions
repopick 223692 # jni: Resolve -Wwritable-strings warnings in helium FW library variables
repopick 223688 # fmapp2: Set LOCAL_PRIVATE_PLATFORM_APIS

# hardware/qcom/power
repopick 223890 # Revert "power: Depend on vendor lineage power HAL"
repopick 223892 # power: Add power hint to set profile

# hardware/samsung
repopick 226072 # liblights: remove unused variable

# lineage-sdk
repopick 225687 # PowerMenuConstants: Add new global action
repopick 225581 # lineage-sdk: Make styles init at system services ready
repopick 225914 # lineage-sdk: Rewrite Lineage preference classes used in about phone view

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
repopick 226145 # LineageParts: Reenable buttons related settings

# packages/apps/Messaging
repopick 225317 # Messaging: Implement option for swipe to delete.
repopick 225318 # Messaging: change Avatar fontFamily to sans-serif-medium
repopick 225319 # MessageQueue: Process pending messages per subscription
repopick 225321 # Messaging: Toggable keyboard emoticons access
repopick 225323 # Fix menu item highlight color.
repopick 225324 # Messaging App is crashing when storage memory is full
repopick 225325 # Messaging: bring back accent color
repopick 225326 # Messaging: Implement saved video attachments in MMS
repopick 225327 # Play an audible notification on receiving a class zero message.
repopick 225328 # Added support for video and audio mms attachments
repopick 225329 # Fixed storage permission issue for attachments
repopick 225330 # Messaging app crashes after a few MMS
repopick 225331 # Use app settings for conversation settings if no custom set
repopick 225332 # Messaging: fix bad recycle on sending two mms in a row
repopick 225333 # MediaPicker: Check for NPE

# packages/apps/Nfc
repopick 223706 # NFC: Restore legacy NXP stack
repopick 223707 # nxp: jni: Forward-port the stack sources
repopick 223697 # nxp: NativeNfcManager: Implement missing inherited abstract methods
repopick 223698 # nxp: jni: use proper nativehelper headers
repopick 223699 # nxp: jni: Remove unused variables and functions
repopick 223700 # NFC: Adding new vendor specific interface to NFC Service
repopick 223701 # NFC: Clean duplicated and unknown permissions
repopick 223703 # nxp: jni: Implement AOSP P abstract methods

# packages/apps/Settings
repopick 226278 # Settings: Add LineageOS entries into device info
repopick 225917 # Settings: Add contributors cloud to device info
repopick 225596 # Settings: Add proximity check on wake preference
repopick 225601 # Settings: display: Add wake on plug switch
repopick 224973 # Settings: gesture: Add LineageParts touchscreen gesture settings
repopick 224974 # Settings: Allow devices to provide remote gesture preferences
repopick 226134 # Settings: Implement ADB notification and ADB over network
repopick 225678 # Settings: Add option to scramble pin layout when unlocking (1/2).
repopick 225686 # Settings: Add advanced restart switch
repopick 225730 # Settings: Add kill app back button toggle
repopick 225768 # Settings: Add an option to force pre-O apps to use full screen aspect ratio
repopick 225800 # Settings: Add rotation settings
repopick 225860 # [1/3] Settings: per-app cellular data and wifi restrictions
repopick 226142 # Settings: Add developer setting for root access
repopick 226146 # Settings: battery: Add LineageParts perf profiles
repopick 226148 # Settings: "Security & location" -> "Security & privacy"
repopick 226149 # Settings: Add LineageOS legal info
repopick 226150 # Settings: add Trust interface hook
repopick 226151 # Settings: show Trust brading in confirm_lock_password UI
repopick 225570 # Settings: Add LineageParts charging sound settings preference
repopick 226279 # Settings: Add back increasing ring feature (2/3).
repopick 225755 # Settings: Hide AOSP theme-related controllers
repopick 225756 # Settings: fix dark style issues
repopick 226154 # fingerprint: Allow devices to configure sensor location
repopick 225858 # storage: Do not allow eject for volumes on non-removable disks
repopick 226391 # Settings: Hide lockdown in lockscreen settings

# packages/apps/WallpaperPicker
repopick 225363 # WallpaperPicker: bump gradle
repopick 225365 # WallpaperPicker: materialize delete icon
repopick 225367 # WallpaperPicker: Update for wallpaper API changes
repopick 225370 # WallpaperPicker: add a "No Wallpaper" option
repopick 225369 # WallpaperPicker: Add icon near dialog items
repopick 225371 # WallpaperPicker: Move strings for translation
repopick 225372 # WallpaperPicker: 15.1 wallpapers

# packages/services/Telecomm
repopick 223099 # Telecomm: Squashed phone_type switch support
repopick 225708 # Add back increasing ring feature (3/3).

# packages/services/Telephony
repopick 225418 # Telephony: Add ERI configuration for U.S. Cellular
repopick 225420 # Use proper summary for network select list preference on dsds/dsda/tsts

# system/bt
repopick 225422 # Bluetooth: Read BLE vendor capability to proceed on Secure conn
repopick 223945 # Prevent abort in case of command timeout
repopick 225423 # Add support to force disable enhanced sco commands

# system/core
privpick system/core refs/changes/19/206119/2 # init: I hate safety net

# system/netd
repopick 225429 # [3/3] NetD : Allow passing in interface names for wifi/data app restriction

# system/sepolicy
repopick 223746 # Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
repopick 223748 # Build sepolicy tools with Android.bp.

# vendor/lineage
repopick 225801 # lineage: Move QC board variables earlier
repopick 225758 # qcom: Declare PRODUCT_SOONG_NAMESPACES for HALs
repopick 226155 # soong_config: Add add_json_str_omitempty function
repopick 225865 # soong_config: Allow extension of valid gralloc 1.0 buffer usage bits
repopick 225942 # soong_config: Allow whitelisted processes to use destroyed mutex
repopick 225921 # overlay: Update list of GSF/GMS activities

# -------------- TOPIC STUFF --------------

repopick -t pie-mode-bits
repopick -t pie-bcm_libbt

exit 0
