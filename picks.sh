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

# bootable/recovery
repopick 222993 # Revert "updater: Remove dead make_parents()."
repopick 222994 # Revert "otautil: Delete dirUnlinkHierarchy()."
repopick 222995 # Revert "kill package_extract_dir"
repopick 222996 # Revert "Remove the obsolete package_extract_dir() test"
repopick 222997 # Revert "updater: Remove some obsoleted functions for file-based OTA."
repopick 222998 # Revert "Format formattable partitions if mount fails"
repopick 223781 # Skip BLKDISCARD if not supported by the device

# build/make
repopick 222750 # edify: bring back SetPermissionsRecursive
repopick 222761 # Allow finer control over how product variables are inherited.
repopick 222762 # Revert "Remove the obsolete UnpackPackageDir() in edify generator"
repopick 222733 # core: Disable vendor restrictions
repopick 225116 # Revert "releasetools: Replace key values in permission files during re-signing"
repopick 222733 # core: Disable vendor restrictions

# build/soong
#repopick 222682 # Use new flex binary
repopick 224613 # soong: Add LOCAL_AIDL_FLAGS handling
repopick 223431 # soong: Enforce absolute path if OUT_DIR is set
repopick 224204 # soong: Add function to return camera parameters library name

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
repopick 224174 # nuplayer: Avoid crash when codec fails to load
repopick 224176 # camera: Don't segfault if we get a NULL parameter
repopick 224177 # cameraservice: Resolve message vs start/stop preview races
repopick 224178 # libstagefright: Support YVU420SemiPlanar camera format
repopick 224179 # stagefright: omx: Don't signal dataspace change on legacy QCOM
repopick 224180 # stagefright: ACodec: Resolve empty vendor parameters usage
repopick 224181 # libstagefright: Free buffers on observer died
repopick 224182 # libstagefright: use 64-bit usage for native_window_set_usage
repopick 224183 # camera/media: Support legacy HALv1 camera in mediaserver
repopick 224184 # Camera: check metadata type before releasing frame
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
#repopick 225541 # OMXNodeInstance: Allow dynamic native handle for shared mem buffer
repopick 224173 # camera: include: Don't override possible overlayed header
repopick 224203 # camera: Allow devices to load custom CameraParameter code
repopick 225798 # libcameraservice: Disable external provider for legacy HAL1

# frameworks/compile/mclinker
#repopick 222683 # Update FlexLinker.h to current version of flex.

# franeworks/native
repopick 225827 # libui: Allow extension of valid gralloc 1.0 buffer usage bits

# frameworks/opt/telephony
repopick 223774 # telephony: Squashed support for simactivation feature

# hardware/interfaces
repopick 225506 # Camed HAL extension: Added support in HIDL for Extended FD.
repopick 225507 # camera: Only link and use vendor.qti.hardware.camera.device if specified

# hardware/libhardware
repopick 223096 # audio: Add audio amplifier HAL
repopick 223097 # hardware/libhw: Add display_defs.h to declare custom enums/flags

# hardware/libhardware_legacy
repopick 225716 # Add wifi_add_or_remove_virtual_intf() to the legacy wifi hal
repopick 223521 # Wifi: Add Qpower interface to libhardware_legacy

# hardware/lineage/interfaces
repopick 223906 # biometrics: fingerprint: add locking to default impl
repopick 223907 # Use -Werror in hardware/interfaces/biometrics/fingerprint
repopick 223908 # fpc: keep fpc in system-background
repopick 224525 # lineage/interfaces: Add basic USB HAL that reports no status change
repopick 223374 # interfaces: Add 2.0 livedisplay interfaces
repopick 223410 # interfaces: Add touch HIDL interface definitions
repopick 223411 # interfaces: Add id HAL definition

# hardware/ril
repopick 224063 # libril: Restore support for RIL v6, v8 and v9 stacks

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

# hardware/ril-caf
repopick 225738 # librilutils: Relocate pb-generated objects to their expected path
repopick 225739 # libril: Restore support for RIL v6, v8 and v9 stacks
repopick 225740 # libril: Bounds check s_commands
repopick 225741 # Make RIL command headers overlayable by devices.
repopick 225742 # libril: Protect against NULL unsolicited response function
repopick 225743 # Revert "Disable rild from starting at power up"

# hardware/samsung
repopick 223882 # resolve compiling warnings/errors
repopick -f 223982 # DNM: exclude AdvancedDisplay *** Revisit after SDK ***

# packages/apps/Camera2
repopick 224752 # Use mCameraAgentNg for getting camera info when available
repopick 225255 # Camera2: Target API 27
repopick 225256 # Don't attempt to convert degree to orientation enum twice
repopick 225257 # Camera2: Only autofocus before a snap if we are actually in "auto" mode.
repopick 225258 # Camera2: Remove settings preferences only once
repopick 225259 # Camera2: Stop using GPS when going to background
#repopick 225260 # Camera: Powerkey shutter (2/2)
#repopick 225261 # Camera2: Add option to set max screen brightness
repopick 225262 # Camera2: Remove google help preference
repopick 225263 # Camera2: Fix Undo button behaviour
repopick 225264 # Fix crash if Exif-Tag buffer-length and component-count are both 0

# packages/apps/Nfc
repopick 223706 # NFC: Restore legacy NXP stack
repopick 223707 # nxp: jni: Forward-port the stack sources
repopick 223697 # nxp: NativeNfcManager: Implement missing inherited abstract methods
repopick 223698 # nxp: jni: use proper nativehelper headers
repopick 223699 # nxp: jni: Remove unused variables and functions
repopick 223700 # NFC: Adding new vendor specific interface to NFC Service
repopick 223701 # NFC: Clean duplicated and unknown permissions
repopick 223703 # nxp: jni: Implement AOSP P abstract methods

# packages/services/Telecomm
repopick 223099 # Telecomm: Squashed phone_type switch support

# system/bt
repopick 225422 # Bluetooth: Read BLE vendor capability to proceed on Secure conn
repopick 223945 # Prevent abort in case of command timeout
repopick 225423 # Add support to force disable enhanced sco commands

# system/core
#repopick 223085 # adbd: Disable "adb root" by system property (2/3)
repopick 223147 # init: don't skip starting a service with no domain if permissive
privpick system/core refs/changes/19/206119/2 # init: I hate safety net

# system/sepolicy
repopick 223746 # Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
repopick 223748 # Build sepolicy tools with Android.bp.

# vendor/lineage
repopick 225550 # soong_config: Add TARGET_NEEDS_LEGACY_CAMERA_HAL1_DYN_NATIVE_HANDLE
repopick 225865 # soong_config: Allow extension of valid gralloc 1.0 buffer usage bits
repopick 225801 # lineage: Move qcom board variables earlier
repopick 225758 # qcom: Declare PRODUCT_SOONG_NAMESPACES for HALs
repopick 225942 # soong_config: Allow whitelisted processes to use destroyed mutex

# -------------- TOPIC STUFF --------------

repopick -t pie-mode-bits
#repopick -t pie-flex-update
#repopick -t pie-AudioFX # *** Wait for SDK ***
#repopick -t pie-FlipFlap
repopick -t lineagehw-hidl
repopick -t pie-bcm_libbt

exit 0
