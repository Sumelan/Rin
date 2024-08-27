{ pkgs, ... }:
{
  imports = [
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

  wal.enable = true;

  gtk = {
    enable = true;
    font = {
      name = "Noto Sans";
    };
    iconTheme = {
      name = "Papirus-Dark-Maia";
      package = pkgs.papirus-maia-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = true;
      gtk-key-theme-name    = "Default";
      gtk-icon-theme-name   = "Papirus-Dark-Maia";
      gtk-cursor-theme-name = "Capitaine Cursors - White";
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  dconf.settings = {
    "org/gnome/desktop/interface" = {
      gtk-key-theme = "Default";
      cursor-theme = "Capitaine Cursors - White";
    };
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };

  # Place Files Inside Home Directory
  home.file."Pictures/wallpapers/default.png" = {
    source = ./assets/nix-wallpaper-stripes-logo.png;
    recursive = true;
  };
  home.file.".pfp.icon".source = ./assets/pfp.png;
  home.file.".fullpfp.icon".source = ./assets/fullpfp.png;
  home.file.".config/pfp.png".source = ./assets/pfp.png;
  home.file.".config/fullpfp.png".source = ./assets/fullpfp.png;

  home.packages = with pkgs; [
    (writeShellScriptBin "wallsetter" (builtins.readFile ./bin/wallsetter/wallsetter.sh) )
    (writeShellScriptBin "powermenu" (builtins.readFile ./bin/rofiscripts/powermenu.sh) )
    (writeShellScriptBin "screenshotmenu" (builtins.readFile ./bin/rofiscripts/screenshot.sh) )
    (writeShellScriptBin "changebrightness" (builtins.readFile ./bin/notifs/changebrightness.sh) )
    (writeShellScriptBin "changevolume" (builtins.readFile ./bin/notifs/changevolume.sh) )
  ];

  home.stateVersion = "23.11";
}
