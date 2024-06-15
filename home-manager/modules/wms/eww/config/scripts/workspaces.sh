#!/bin/bash

# wsNumber at current desktop.
currentDesktop="$(echo -e "$(hyprctl -j monitors)" | jq -r '.[0] | "\(.activeWorkspace.id)"')"
# all count of workspaces.
countWorkspace="$(echo -e "$(hyprctl -j workspaces)" | jq 'map(.id) | max')"
# wsNumber that is not empty.
wsNumber="$(echo -e "$(hyprctl -j workspaces)" | jq -r '.[] | "\(.id)"')"
# command for eww.
COMMAND="(box	:class \"works\"	:orientation \"h\" :spacing 5 :space-evenly \"false\""

# Main
for WS in $(seq $countWorkspace)
do
    if [[ ! "${wsNumber[*]}" =~ "${WS}" ]]; then
         statusClass="ws_inactive"
         # icon="󰧞"
         icon="󰣏"
        elif [ $currentDesktop -eq ${WS} ]; then
        statusClass="ws_active"
        # icon="󰮯"
         # icon=""
         icon=""
    else
        statusClass="ws_occupied"
        # icon="󰊠"
        # icon=""
        icon="󰮿"
    fi
    buffered=$' '
    buffered="(label :class '$statusClass' :text '$icon')"
    echo "(box :space-evenly false :spacing 20 $buffered)"
done


