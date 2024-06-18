{ config, ... }:
let
  theme = config.colorScheme.palette;
in
  ''
  #!/bin/sh
  case "$(echo -e "Shutdown\nRestart\nLogout\nSuspend\nLock" | dmenu \
      -fn "Iosevka Nerd Font:size=14" \
      -nb "#${theme.base00}" \
      -nf "#${theme.base05}" \
      -sf "#${theme.base0D}" \
      -sb "#${theme.base04}" \
       -p \
      "Power:" )" in
          Shutdown) exec systemctl poweroff;;
          Restart) exec systemctl reboot;;
          Logout) kill -HUP $XDG_SESSION_PID;;
          Suspend) exec systemctl suspend;;
          Lock) exec dlock;;
  esac
''
