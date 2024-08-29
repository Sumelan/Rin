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

  # Programs
  programs = {
    home-manager.enable = true;
    brave = {
      enable = true;
      # Enable fcitx5
      commandLineArgs = ["--enable-features=UseOzonePlatfor" "--ozone-platform=x11"];
    };
    starship = {
      enable = true;
    };
    git = {
      enable = true;
      userName  = "bathys";
      userEmail = "bathys@proton.me";
    };
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

  # Styling Options
  stylix.targets = {
    rofi.enable = false;
    hyprland.enable = false;
  };
  gtk = {
    iconTheme = {
      name = "Papirus-Dark";
      package = pkgs.papirus-icon-theme;
    };
    gtk3.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
    gtk4.extraConfig = {
      gtk-application-prefer-dark-theme = 1;
    };
  };
  qt = {
    enable = true;
    style.name = "adwaita-dark";
    platformTheme.name = "gtk3";
  };
  
  # Place Files Inside Home Directory
  home.file.".config/wallpaper.png" = {
    source = ./assets/rin-wallpaper.png;
    recursive = true;
  };
  home.file.".pfp.icon".source = ./assets/pfp.png;
  home.file.".fullpfp.icon".source = ./assets/fullpfp.png;
  home.file.".config/pfp.png".source = ./assets/pfp.png;
  home.file.".config/fullpfp.png".source = ./assets/fullpfp.png;

  # Scripts
  home.packages = with pkgs; [
    (writeShellScriptBin "wallsetter" (builtins.readFile ./bin/wallsetter/wallsetter.sh) )
    (writeShellScriptBin "powermenu" (builtins.readFile ./bin/rofiscripts/powermenu.sh) )
    (writeShellScriptBin "screenshotmenu" (builtins.readFile ./bin/rofiscripts/screenshot.sh) )
    (writeShellScriptBin "changebrightness" (builtins.readFile ./bin/notifs/changebrightness.sh) )
    (writeShellScriptBin "changevolume" (builtins.readFile ./bin/notifs/changevolume.sh) )
  ];

  home.stateVersion = "23.11";
}
