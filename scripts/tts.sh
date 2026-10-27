#!/usr/bin/env bash

# # To create the sink and stuff
#
# pactl load-module module-null-sink sink_name=tts_sink
#
# pactl load-module module-remap-source \
#     master=tts_sink.monitor \
#     source_name=tts_mic \
#     source_properties=device.description=TTS-Mic

set -x

tmpFile="$HOME/Desktop/notes/tts-input.txt"
tmpOut=$(mktemp --suffix=.mp3)

trap 'rm -f "$tmpOut"' EXIT

kitty +kitten panel \
    --layer overlay \
    --edge center-sized \
    --lines 30 \
    --columns 140 \
    --focus-policy exclusive \
    --single-instance \
    --instance-group tts-panel \
    --toggle-visibility \
    nvim "$tmpFile"

text="$(
  grep -vE '^[[:space:]]*;;' "$tmpFile" |
  sed '/^[[:space:]]*$/d'
)"

gtts-cli \
  -l fr \
  "$text" \
  -o "$tmpOut"

/usr/bin/mpv                               "$tmpOut" &
/usr/bin/mpv --audio-device=pulse/tts_sink "$tmpOut"
