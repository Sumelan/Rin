{ inputs, pkgs, theme, ... }:
{
  imports = [
    ./eww_colors.nix
    ./modules/bundle.nix
  ];

# Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home = {
    username = "bathys";
    homeDirectory = "/home/bathys";
  };

  programs = {
    home-manager.enable = true;
  };

# Create XDG Dirs
  xdg = {
    userDirs = {
      enable = true;
      createDirectories = true;
    };
  };

  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  home.packages = with pkgs; [
    (writeShellScriptBin "wallsetter" (builtins.readFile ./bin/wallsetter.sh) )
    (writeShellScriptBin "powermenu" (builtins.readFile ./bin/rofiscripts/powermenu.sh) )
    (writeShellScriptBin "screenshotmenu" (builtins.readFile ./bin/rofiscripts/screenshot.sh) )
    (writeShellScriptBin "wifimenu" (builtins.readFile ./bin/rofiscripts/wifi.sh) )
    (writeShellScriptBin "changebrightness" (builtins.readFile ./bin/notifs/changebrightness.sh) )
    (writeShellScriptBin "changevolume" (builtins.readFile ./bin/notifs/changevolume.sh) )
  ];

  home.stateVersion = "23.11";
}
