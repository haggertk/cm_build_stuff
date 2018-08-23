#!/bin/bash

set -e

source build/envsetup.sh

# -------------- DEVICE STUFF --------------

# device/samsung/hlte-common
repopick 225612 # hlte-common: wlan: Update supplicant services for new calling sequence
repopick 225613 # hlte-common: wifi_supplicant: deprecate entropy.bin
repopick 225614 # hlte-common: wpa_supplicant: Move control sockets to /data/vendor
repopick 225615 # hlte-common: Don't start supplicant with interfaces
repopick 225616 # hlte-common: wpa_supplicant(hidl): Add support for starting HAL lazily
repopick 225617 # hlte-common: Add p2p_no_group_iface=1 to p2p_supplicant_overlay
repopick 225618 # hlte-common: Align ril.h to samsung_msm8974-common P libril changes
repopick 225619 # DO NOT MERGE: hlte-common: Requisite bring-up BS change

# device/samsung/klte-common
repopick 225186 # klte-common: wlan: Update supplicant services for new calling sequence
repopick 225187 # klte-common: wifi_supplicant: deprecate entropy.bin
repopick 225188 # klte-common: wpa_supplicant: Move control sockets to /data/vendor
repopick 225189 # klte-common: Don't start supplicant with interfaces
repopick 225190 # klte-common: wpa_supplicant(hidl): Add support for starting HAL lazily
repopick 225191 # klte-common: Add p2p_no_group_iface=1 to p2p_supplicant_overlay
repopick 225192 # klte-common: Align ril.h to samsung_msm8974-common P libril changes
repopick 224917 # DO NOT MERGE: klte-common: Requisite bring-up BS change

# device/samsung/msm8974-common
repopick 224851 # msm8974-common: config.fs: Add 'VENDOR' prefix to AIDs
repopick 225249 # msm8974-common: Uprev Wi-Fi HAL to 1.2
repopick 225250 # msm8974-common: Uprev to supplicant 1.1
repopick 225251 # msm8974-common: Add hostapd HIDL interface
repopick 225620 # msm8974-common: Switch to common basic USB HAL
repopick 225466 # msm8974-common: libril: Remove LOCAL_CLANG
repopick 225467 # msm8974-common: libril: Fix Const-Correctness for RIL_RadioFunctions
repopick 225468 # msm8974-common: libril: Remove unused code
repopick 225469 # msm8974-common: libril: Fix double freeing of memory in SAP service and add null-checks.
repopick 225470 # msm8974-common: libril: Store the system time when NITZ is received.
repopick 225471 # msm8974-common: libril: Add DISABLE_RILD_OEM_HOOK.
repopick 225472 # msm8974-common: libril:  Change rild initial sequence to guarantee non-null function pointer before rild register its hidl service
repopick 225473 # msm8974-common: libril: Add SIM_ABSENT error
repopick 224916 # DO NOT MERGE: msm8974-common: sepolicy: Just make it build

# -------------- PLATFORM STUFF --------------

# bionic
repopick 223065 # linker: Add support for dynamic SHIM libraries
repopick 223943 # bionic: meh

# bootable/recovery
repopick 222993 # Revert "updater: Remove dead make_parents()."
repopick 222994 # Revert "otautil: Delete dirUnlinkHierarchy()."
repopick 222995 # Revert "kill package_extract_dir"
repopick 222996 # Revert "Remove the obsolete package_extract_dir() test"
repopick 222997 # Revert "updater: Remove some obsoleted functions for file-based OTA."
repopick 222998 # Revert "Format formattable partitions if mount fails"
repopick 223781 # Skip BLKDISCARD if not supported by the device
repopick 224657 # otautil/DirUtil: Fix missing PATH_MAX macro from limits.h

# build/make
repopick 222750 # edify: bring back SetPermissionsRecursive
repopick 222761 # Allow finer control over how product variables are inherited.
repopick 222762 # Revert "Remove the obsolete UnpackPackageDir() in edify generator"
repopick 222733 # core: Disable vendor restrictions

# build/soong
repopick 222857 # locale: add C.utf8
#repopick 222682 # Use new flex binary
repopick 224613 # soong: Add LOCAL_AIDL_FLAGS handling
repopick 223431 # soong: Enforce absolute path if OUT_DIR is set

# device/lineage/sepolicy
repopick 224765 # sepol: Remove exfat context
repopick 224766 # sepol: Remove recovery access to vold_socket
repopick 225115 # common: Label common basic USB HAL

# device/qcom/sepolicy
repopick 224767 # sepol: Remove duplicated hal_vehicle attribute
repopick 224768 # sepol: hostapd is now hal_wifi_hostapd
repopick 225036 # common: Remove duplicate definition of hostapd data files

# external/tinycompress
repopick 223008 # tinycompress: squash tinycompress fixes
repopick 223009 # tinycompress: Add get_metadata() and set_metadata() API support
repopick 223010 # tinycompress: Generate vendor specifc tinycompress
repopick 223011 # tinycompress: Fix compilation on old targets
repopick 223012 # audio: compress error propagation
repopick 223013 # tinycompress: Move [get,set]_metadata to vendor extension
repopick 223014 # Revert "libtinycompress: Android.mk -> Android.bp"
repopick 223015 # tinycompress: include kernel headers
repopick 223016 # tinycompress: Set -Wno-unused functions

# frameworks/av
repopick 223017 # audiopolicy: make audio policy extensible
repopick 224174 # nuplayer: Avoid crash when codec fails to load
repopick 224216 # MTP: Fix crash when no storages are available
repopick 224176 # camera: Don't segfault if we get a NULL parameter
repopick 224177 # cameraservice: Resolve message vs start/stop preview races
repopick 224178 # libstagefright: Support YVU420SemiPlanar camera format
repopick 224179 # stagefright: omx: Don't signal dataspace change on legacy QCOM
repopick 224180 # stagefright: ACodec: Resolve empty vendor parameters usage
repopick 224181 # libstagefright: Free buffers on observer died
repopick 224182 # libstagefright: use 64-bit usage for native_window_set_usage
repopick 224183 # camera/media: Support legacy HALv1 camera in mediaserver
repopick 224184 # Camera: check metadata type before releasing frame

# frameworks/compile/mclinker
#repopick 222683 # Update FlexLinker.h to current version of flex.

# frameworks/opt/telephony
repopick 223774 # telephony: Squashed support for simactivation feature

# hardware/libhardware
repopick 223096 # audio: Add audio amplifier HAL
repopick 223097 # hardware/libhw: Add display_defs.h to declare custom enums/flags
repopick 223098 # audio_amplifier: add hooks for stream parameter manipulation

# hardware/libhardware_legacy
repopick 223521 # Wifi: Add Qpower interface to libhardware_legacy

# hardware/lineage/interfaces
repopick 223906 # biometrics: fingerprint: add locking to default impl
repopick 223907 # Use -Werror in hardware/interfaces/biometrics/fingerprint
repopick 223908 # fpc: keep fpc in system-background
repopick 224525 # lineage/interfaces: Add basic USB HAL that reports no status change

# hardware/ril
repopick 224062 # libril: allow board to provide libril
repopick 224063 # libril: Restore support for RIL v6, v8 and v9 stacks

# hardware/qcom/audio-caf/msm8974
repopick 223436 # Add -Wno-error to compile with global -Werror.

# hardware/qcom/display-caf/msm8974
repopick 223433 # Use libhwui.so instead of libskia.so
repopick 223434 # Include what we use.
repopick 223435 # Add -Wno-error to compile with global -Werror.

# hardware/qcom/media-caf/msm8974
repopick 223441 # Add -Wno-error to compile with global -Werror.

# hardware/qcom/power
repopick 223892 # power: Add power hint to set profile
repopick 223890 # Revert "power: Depend on vendor lineage power HAL"

# hardware/samsung
repopick 223882 # resolve compiling warnings/errors
repopick 223982 # DNM: exclude AdvancedDisplay *** Revisit after SDK ***

# packages/apps/Camera2
repopick 224752 # Use mCameraAgentNg for getting camera info when available
repopick 225255 # Camera2: Target API 27
repopick 225256 # Don't attempt to convert degree to orientation enum twice
repopick 225257 # Camera2: Only autofocus before a snap if we are actually in "auto" mode.
repopick 225258 # Camera2: Remove settings preferences only once
repopick 225259 # Camera2: Stop using GPS when going to background
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
repopick 223085 # adbd: Disable "adb root" by system property (2/3)
repopick 223147 # init: don't skip starting a service with no domain if permissive

# system/sepolicy
repopick 223745 # Allow e2fs to format cache
repopick 223746 # Add rules required for TARGET_HAS_LEGACY_CAMERA_HAL1
repopick 223748 # Build sepolicy tools with Android.bp.
repopick 224808 # sepolicy: We need to declare before referencing
repopick 224809 # sepolicy: Allow su by apps on userdebug_or_eng
repopick 224810 # sepolicy: update policies for sudaemon on O
repopick 224811 # sepolicy: add sudaemon to ignore list
repopick 224812 # sepolicy: Allow recovery to write to rootfs

# vendor/lineage
repopick 224511 # config/common: Clean up debug packages
repopick 223980 # lineage: Exclude all lineage overlays from RRO
repopick 224421 # overlay: Default materials buttons to not all caps
repopick 224021 # overlay: Fix status bar padding for all devices
repopick 224893 # overlay: Remove deprecated overlay
repopick 224649 # overlay: Enable rounded corners for dialogues and buttons
repopick 224759 # lineage: Ignore neverallows

# vendor/qcom/opensource/audio
repopick 224975 # [TMP] Align with AOSP
repopick 225028 # policy_hal: Line up default features with audio HAL

# -------------- TOPIC STUFF --------------

repopick -t deprecate-per-SoC-custom-audio-policy-HAL
repopick -t pie-mode-bits
#repopick -t pie-flex-update
#repopick -t pie-AudioFX # *** Wait for SDK ***
#repopick -t pie-FlipFlap
repopick -t lineagehw-hidl
repopick -t pie-bcm_libbt

exit 0
