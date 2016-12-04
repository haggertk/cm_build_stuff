#!/bin/bash

source build/envsetup.sh

# msm: clock-krait-8974: Add support to read SVS PVS bin
repopick 174429

# PM / devfreq: Check for GPU busy time before sending the sample
repopick 174430

# klte-common: activate large_tcp_window_size
repopick 174427
