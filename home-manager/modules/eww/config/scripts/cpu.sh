#!/bin/sh
CPU=$(cat /sys/class/hwmon/hwmon1/temp1_input)
TEMP=$((CPU / 1000))
echo $TEMP
