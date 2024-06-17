#!/usr/bin/env bash

## Get data
STATUS="$(playerctl status)"
COVERURL="$(playerctl metadata | grep artUrl | awk '{print $3}')
COVER="$HOME/.config/eww/cache/.music_cover.png"
MUSIC_DIR="$HOME/Music"

## Get status
get_status() {
	if [[ $STATUS == "Playing" ]]; then
		echo "󰏤"
	else
		echo "󰐊"
	fi
}

## Get song
get_song() {
	song=`playerctl metadata --format "{{ title }}"`
	if [[ -z "$song" ]]; then
		echo "Offline"
	else
		echo "$song"
	fi
}

## Get artist
get_artist() {
	artist=`playerctl metadata --format "{{ artist }}"`
	if [[ -z "$artist" ]]; then
		echo ""
	else
		echo "$artist"
	fi
}

## Get time
get_time() {
	time=`playerctl position --format "{{ duration(mpris:length - position) }}"`
	if [[ -z "$time" ]]; then
		echo "0"
	else
		echo "$time"
	fi
}
get_ctime() {
	ctime=`playerctl metadata --format "{{ duration(position) }}"`
	if [[ -z "$ctime" ]]; then
		echo "0:00"
	else
		echo "$ctime"
	fi
}
get_ttime() {
	ttime=`playerctl metadata --format "{{ duration(mpris:length) }}"`
	if [[ -z "$ttime" ]]; then
		echo "0:00"
	else
		echo "$ttime"
	fi
}

## Get cover
get_cover() {

  ffmpeg -i ${COVERURL} "${COVER}" -y &> /dev/null
	STATUS=$?

	# Check if the file has a embbeded album art
	if [ "$STATUS" -eq 0 ];then
		echo "$COVER"
	else
		echo "images/music.png"
	fi 
}

## Execute accordingly
if [[ "$1" == "--song" ]]; then
	get_song
elif [[ "$1" == "--artist" ]]; then
	get_artist
elif [[ "$1" == "--status" ]]; then
	get_status
elif [[ "$1" == "--time" ]]; then
	get_time
elif [[ "$1" == "--ctime" ]]; then
	get_ctime
elif [[ "$1" == "--ttime" ]]; then
	get_ttime
elif [[ "$1" == "--cover" ]]; then
	get_cover
elif [[ "$1" == "--toggle" ]]; then
  playerctl play-pause
elif [[ "$1" == "--next" ]]; then
	{ playerctl next; get_cover; }
elif [[ "$1" == "--prev" ]]; then
	{ playerctl previous; get_cover; }
fi
