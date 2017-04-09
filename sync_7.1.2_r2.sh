#!/bin/bash

# Eventually we'll push to some branch on lineage's github, once it at least builds (boot would be ideal too)
# Need to look at system/bt and evaluate options. Maybe cherry pick stuff from aosp that we want?

repo init https://review.lineageos.org/LineageOS/android -b refs/changes/10/167810/3
repo sync -j16 -q -d --force-sync

repos=(
art
bionic
bootable/recovery
build
dalvik
development
external/aac
external/boringssl
external/flac
external/icu
external/ipsec-tools
external/libnfc-nci
external/okhttp
external/openssh
external/skia
external/tinyalsa
external/toybox
frameworks/av
frameworks/base
frameworks/native
frameworks/opt/chips
frameworks/opt/datetimepicker
frameworks/opt/net/ims
frameworks/opt/net/wifi
frameworks/opt/telephony
frameworks/opt/vcard
frameworks/support
hardware/broadcom/libbt
hardware/broadcom/wlan
hardware/intel/common/libmix
hardware/intel/common/omx-components
hardware/intel/img/hwcomposer
hardware/intel/img/psb_video
hardware/libhardware
hardware/qcom/audio/default
hardware/qcom/bootctrl
hardware/qcom/bt
hardware/qcom/camera
hardware/qcom/display
hardware/qcom/gps
hardware/qcom/media
hardware/ril
libcore
packages/apps/Bluetooth
packages/apps/Camera2
packages/apps/CarrierConfig
packages/apps/CellBroadcastReceiver
packages/apps/CertInstaller
packages/apps/Contacts
packages/apps/ContactsCommon
packages/apps/DeskClock
packages/apps/Dialer
packages/apps/Email
packages/apps/EmergencyInfo
packages/apps/ExactCalculator
packages/apps/Gallery2
packages/apps/KeyChain
packages/apps/ManagedProvisioning
packages/apps/Messaging
packages/apps/Nfc
packages/apps/PackageInstaller
packages/apps/PhoneCommon
packages/apps/Settings
packages/apps/Stk
packages/apps/StorageManager
packages/apps/TvSettings
packages/apps/UnifiedEmail
packages/apps/WallpaperPicker
packages/inputmethods/LatinIME
packages/providers/ContactsProvider
packages/providers/DownloadProvider
packages/providers/MediaProvider
packages/providers/TelephonyProvider
packages/providers/TvProvider
packages/providers/UserDictionaryProvider
packages/screensavers/PhotoTable
packages/services/Car
packages/services/Mms
packages/services/Telecomm
packages/services/Telephony
packages/wallpapers/LivePicker
system/bt
system/core
system/extras
system/keymaster
system/media
system/netd
system/security
system/sepolicy
system/vold
vendor/cm
)

for r in ${repos[@]}; do
  cd $r
  git fetch github staging/cm-14.1_android-7.1.2_r2
  git reset --hard staging/cm-14.1_android-7.1.2_r2
  cd - > /dev/null
done

echo "Ready to build!"
