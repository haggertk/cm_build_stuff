#!/bin/bash

set -e

source build/envsetup.sh

# -------------- DEVICE STUFF --------------

# device/samsung/klte

# device/samsung/klte-common
repopick 224852 # klte-common: Import stock Dalvik heap overrides
repopick 224853 # klte-common: Increase heap start size to 16m to minimize GC with larger bitmaps
repopick 224917 # DO NOT MERGE: klte-common: Requisite bring-up BS change

# device/samsung/msm8974-common
repopick 224851 # msm8974-common: config.fs: Add 'VENDOR' prefix to AIDs
repopick 224916 # DO NOT MERGE: msm8974-common: Disable our and device/qcom sepolicy

# device/samsung/qcom-common
repopick 224845 # qcom-common: doze: Set LOCAL_PRIVATE_PLATFORM_APIS

# -------------- PLATFORM STUFF --------------

# bionic
repopick 223064 # linker: Make platform text relocations denial optional

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
repopick 222809 # DO NOT MERGE: disable inclusion of Lineage sepol

# build/soong
repopick 222857 # locale: add C.utf8
repopick 222682 # Use new flex binary
repopick 224613 # soong: Add LOCAL_AIDL_FLAGS handling
repopick 223431 # soong: Enforce absolute path if OUT_DIR is set

# device/lineage/sepolicy
repopick 224765 # sepol: Remove exfat context
repopick 224766 # sepol: Remove recovery access to vold_socket

# device/qcom/sepolicy
repopick 224767 # sepol: Remove duplicated hal_vehicle attribute
repopick 224768 # sepol: hostapd is now hal_wifi_hostapd

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
repopick 222683 -P frameworks/compile/mclinker # Update FlexLinker.h to current version of flex.

# frameworks/opt/telephony
repopick 223774 # telephony: Squashed support for simactivation feature

# hardware/libhardware
repopick 223096 # audio: Add audio amplifier HAL
repopick 223097 # hardware/libhw: Add display_defs.h to declare custom enums/flags
repopick 223098 # audio_amplifier: add hooks for stream parameter manipulation

# hardware/libhardware_legacy
repopick 223521 # Wifi: Add Qpower interface to libhardware_legacy

# hardware/ril
repopick 224062 # libril: allow board to provide libril

# hardware/qcom/audio-caf/msm8974
repopick 223436 # Add -Wno-error to compile with global -Werror.

# hardware/qcom/display-caf/msm8974
repopick 223433 # Use libhwui.so instead of libskia.so
repopick 223434 # Include what we use.
repopick 223435 # Add -Wno-error to compile with global -Werror.

# hardware/qcom/media-caf/msm8974
repopick 223441 # Add -Wno-error to compile with global -Werror.

# hardware/samsung
repopick 223882 # resolve compiling warnings/errors
repopick 223982 # DNM: exclude AdvancedDisplay *** Revisit after SDK ***

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
repopick 223945 # Prevent abort in case of command timeout
repopick 224813 # bt: osi: undef PROPERTY_VALUE_MAX

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

# -------------- TOPIC STUFF --------------

repopick -t deprecate-per-SoC-custom-audio-policy-HAL
repopick -t pie-mode-bits
repopick -t pie-AudioFX
repopick -t pie-FlipFlap

exit 0
