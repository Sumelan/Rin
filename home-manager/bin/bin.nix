{ config, ... }:
{
  home.file ={
    ".local/bin/dmenupower" = {
      executabale = true;
      text = import ./dmenu/power.nix { };
    };
    ".local/bin/dmenudictionary" = {
      executable = true;
      text = import ./dmenu/dictionary.nix { };
    };
    ".local/bin/wifimenu" = {
      executable = true;
      text = import ./rofiscripts/wifi.sh;
    };
    ".local/bin/powermenu" = {
      executable = true;
      text = import ./rofiscripts/powermenu.sh;
    };
    ".local/bin/changebrightness" = {
      executable = true;
      text = import ./notifs/changebrightness.nix { };
    };
    ".local/bin/changevolume" = {
      executable = true;
      text = import ./notifs/changevolume.nix { };
    };
  };
}
