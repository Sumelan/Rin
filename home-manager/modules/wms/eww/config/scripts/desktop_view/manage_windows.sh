#! /usr/bin/env nix-shell
#! nix-shell -i bash -p bash


######################################################################
## You need to install wmctrl
######################################################################

killWin() {
    if [ "$1" != "" ]; then
        hyprctl dispatch closewindow $(echo $1 | sed -e s/\.jpg//g)
    fi
}

# Main
if [ "$1" == "--kill" ]; then
    killWin $2
fi
