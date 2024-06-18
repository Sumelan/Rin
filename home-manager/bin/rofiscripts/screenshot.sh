#!/usr/bin/env bash

active="Active window"
screen="All visible outputs"
output="Currently active output"
area="Select an area"

copy="Copy to clipboard"
save="Save file"

tmp_filename="/tmp/screenshot_$(date +%d)-$(date +%m)-$(date +%y)_$(date +%T).png"

# Function taken directly from grimshot
# https://github.com/swaywm/sway/blob/master/contrib/grimshot
target_directory() {
  echo ~/Pictures/Screenshots
}

# Rofi CMD
rofi_cmd() {
	rofi -dmenu \
		-mesg "Screenshot" -theme-str 'inputbar { enabled: false; }'
}

# Pass variables to rofi dmenu
run_rofi() {
	echo -e "$active\n$screen\n$output\n$area\n$window" | rofi_cmd
}

# Mode selection
mode_cmd() {
  rofi -dmenu
}

# Ask to select mode
select_mode() {
	echo -e "$copy\n$save" | mode_cmd
}

menu_option="$(run_rofi)"
if [[ ! -z "$menu_option" ]]
then
  case $menu_option in
  	$active)
  	grimblast --notify save active $tmp_filename > /dev/null 2>&1
  		;;
  	$screen)
  	grimblast --notify save screen $tmp_filename > /dev/null 2>&1
  		;;
  	$output)
  	grimblast --notify save output $tmp_filename > /dev/null 2>&1
  		;;
  	$area)
  	grimblast --notify save area $tmp_filename > /dev/null 2>&1
  		;;
  esac
  mode="$(select_mode)"
  if [[ ! -z "$mode" ]]
  then
  	case $mode in
  		$copy)
  		wl-copy --type image/png < $tmp_filename
  			;;
  		$save)
  		cp $tmp_filename $(target_directory)
  			;;
  	esac
  fi
  	rm $tmp_filename
  fi
