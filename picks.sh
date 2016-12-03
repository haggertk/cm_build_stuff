#!/bin/bash

source build/envsetup.sh

# liblights: Allow devices to override node paths
repopick 172781

# PhoneWindowManager: Implement press home to answer call
repopick 174173

# msm: clock-krait-8974: Add support to read SVS PVS bin
repopick 174429

# PM / devfreq: Check for GPU busy time before sending the sample
repopick 174430

# liblights: Remove device level HAL
repopick 174076

# klte-common: activate large_tcp_window_size
repopick 174427
