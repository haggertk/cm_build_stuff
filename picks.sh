#!/bin/bash

set -e

function privpick() {
  git -C $1 fetch github $2
  git -C $1 cherry-pick FETCH_HEAD
}

function checkchain() {
  git -C $1 fetch github $2
  git -C $1 checkout FETCH_HEAD
}

source build/envsetup.sh

# -------------- DEVICE STUFF --------------

# -------------- PLATFORM STUFF --------------

# frameworks/base
repopick 317786 # monet: Add support for monet (cam16)
repopick 320839 # PhoneWindowManager: add LineageButtons volumekey hook
repopick 320840 # Long-press power while display is off for torch
repopick 320841 # Reimplement hardware keys custom rebinding
repopick 320842 # Reimplement device hardware wake keys support
repopick 320843 # PhoneWindowManager: Tap volume buttons to answer call
repopick 320844 # PhoneWindowManager: Implement press home to answer call
repopick 320845 # fw/b: Allow customisation of navbar app switch long press action
repopick 320846 # PhoneWindowManager: Allow torch and track skip during ambient display
repopick 320847 # fw/b torch: Let long press power turn torch off when screen is on.
repopick 320848 # Implement edge long swipe gesture [1/3]
repopick 317412 # SystemUI: add FloatingRotationButton for hw-key devices
repopick 321274 # SystemUI: don't show FRB when IME is visible
repopick 320849 # PhoneWindowManager: Add support for back key long press customization
repopick 320853 # Don't pass repeated back key events to app if custom action is set up
repopick 320850 # PhoneWindowManager: Forward port long press back to kill app
repopick 320851 # Use custom flag for edge long swipe gesture
repopick 320856 # Forward port 'Swap volume buttons' (1/3)
repopick 320857 # Camera button support
repopick 320860 # Add support for runtime toggle of navbar
repopick 320896 # fw/b: Button backlight brightness
repopick 320897 # PowerManagerService: Allow to light up buttons only when pressed
repopick 320898 # PowerManager: Allow to distinguish different keypresses
repopick 320904 # fwb: Re-introduce keyboard backlight brightness control
repopick 318763 # SystemUI: runtime configurable audio panel location
repopick 321056 # frameworks: Power menu customizations
repopick 321292 # Use flow layout for advanced power menu aswell
repopick 320947 # SystemUI: Port statusbar brightness control
repopick 321160 # Keyguard: Allow disabling fingerprint wake-and-unlock
repopick 320714 # SystemUI: add burnIn protection

# frameworks/native
repopick 320855 # Forward port 'Swap volume buttons' (2/3)
repopick 320894 # PowerManager.h: Define USER_ACTIVITY_FLAG values
repopick 320895 # InputDispatcher: On keypress, deliver keycode to pokeUserActivity

# lineage-sdk
repopick 320854 # sdk: Move app killed toast message to main application thread

# packags/apps/Settings
repopick 321051 # Settings: Add advanced restart switch

# packages/apps/Trebuchet
repopick 317966 # Enable new app open/close animations
repopick 317967 # Enable crossfade when changing theme
repopick 317968 # Enable new keyguard-to-launcher animation
repopick 317969 # Expose themed icon setting in ThemePicker
repopick 317971 # QuickStep: Google Feed integration
repopick 318383 # Enable local colors for popup menu items
repopick 318384 # Add ripple animation to task menu items
repopick 320939 # Implement LocalColorExtractor using monet theme engine

# vendor/lineage
repopick 318283 # overlay: core: Remove accent color overrides
repopick 317788 # overlay: Enable monet

# -------------- TOPIC STUFF --------------

exit 0
