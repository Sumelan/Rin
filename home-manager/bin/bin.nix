{ config, ... }:
{
  home.file ={
    ".local/bin/wifimenu" = {
      executable = true;
      text = import ./rofiscripts/wifi.sh { };
    };
    ".local/bin/screenshotmenu" = {
        executable = true;
        text = import ./rofiscripts/screenshot.nix { };
      };
    ".local/bin/powermenu" = {
      executable = true;
      text = import ./rofiscripts/powermenu.sh { };
    };
    ".local/bin/changebrightness" = {
      executable = true;
      text = import ./notifs/changebrightness.sh { };
    };
    ".local/bin/changevolume" = {
      executable = true;
      text = import ./notifs/changevolume.sh { };
    };
  };
}
