#!/usr/bin/env bash
sleep 0.3

today=$(date '+%Y.%m.%d')
exec "$HOME/.cargo/bin/eitype" --layout ca "$today"
