#!/bin/bash

# To-Do: Delete the tmp files with more smart way.

ewwPath="$HOME/.config/eww"
tmpPath="$HOME/.cache/eww/left_widget"
v0="SHOW_BAR_CENTER"
v1="SHOW_LEFT_WIDGET"

if [ ! -d $HOME/.cache/eww ]; then
    mkdir $HOME/.cache/eww;
fi

window="window_left_widget"

toggle() {
    if [ -f $tmpPath ]; then
        rm $tmpPath
        eww -c $ewwPath close $window
        eww -c $ewwPath update $v1=false
    else
        touch $tmpPath
    
        # Preludes uwu*
        eww -c $ewwPath update $v0=false
        sleep 0.3
        eww -c $ewwPath open-many $window
        eww -c $ewwPath update $v1=true
    
        # Run service
        $ewwPath/scripts/bluetooth.sh --update_eww_json
        $ewwPath/scripts/network.sh --update_eww_json
    fi
}

# Main
if [ "$1" == "--open" ]; then
    touch $tmpPath

    # Preludes uwu*
    eww -c $ewwPath update $v0=false
    sleep 0.3
    eww -c $ewwPath open-many $window 
    eww -c $ewwPath update $v1=true

    # Run service
    $ewwPath/scripts/bluetooth.sh --update_eww_json
    $ewwPath/scripts/network.sh --update_eww_json
elif [ "$1" == "--toggle" ]; then
    toggle
elif [ "$1" == "--close" ]; then
    rm $tmpPath
    eww -c $ewwPath close $window
    eww -c $ewwPath update $v1=false
fi








