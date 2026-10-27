#!/usr/bin/env bash

exec kitty +kitten panel \
    --layer overlay \
    --edge center-sized \
    --lines 30 \
    --columns 140 \
    --focus-policy exclusive \
    --single-instance \
    --instance-group rmpc-panel \
    --toggle-visibility \
    rmpc
