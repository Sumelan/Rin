{ config, ... }:
let
  theme = config.colorScheme.palette;
in

  ''
  #!/usr/bin/env bash

  set -e

  case "$1" in
    "list")
      data=$(sed '0,/^__DATA__$/d' "$0")
      echo "$data"
      ;;
    "copy")
      input=$(tee)
      if [ ! -z "$input" ]; then
        word=$(expr substr "$input" $(expr length "$input") 1)
        echo -n "$word" | xclip -selection c
        command -v notify-send > /dev/null && notify-send -t 200 "$word copied!"
      fi
      ;;
    "")
      bash $0 list | dmenu  -fn "Iosevka Nerd Font:size=14" -nb "#${theme.base00}" -nf "#${theme.base05}" -sf "#${theme.base0D}" -sb "#${theme.base0C}" -p 'Word: ' | bash $0 copy
      ;;
  esac

  exit

  __DATA__



  ''

