#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash

confPath="$HOME/.config/eww/scripts/cava/config"

# Main
cava -p $confPath | while read -r line; do echo $line| sed -e 's/;/,/g'; done | while read -r line; do echo "["`echo ${line/%?/}`"]"; done
