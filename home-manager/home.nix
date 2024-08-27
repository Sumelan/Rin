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

  xdg.mime.enable = false;
  xdg.mimeApps = {
    enable = true;
    defaultApplications = {
      "inode/directory" = ["Thunar.desktop"];
      "image/png" = ["imv.desktop"];
      "image/jpeg" = ["imv.desktop"];
    };
  };

  wal.enable = true;

  gtk = {
    enable = true;
    font = {
      name = "Noto Sans";
      package = pkgs.noto-fonts;
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
  };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
  };

  home.file.".icons/default".source = "${pkgs.capitaine-cursors}/share/icons/capitaine-cursors-white";
  home.sessionVariables = {
    XCURSOR_SIZE = 16;
    XCURSOR_THEME = "Capitaine Cursors - White";
  };
  xdg.systemDirs.data = [
    "${pkgs.gtk3}/share/gsettings-schemas/${pkgs.gtk3.name}"
    "${pkgs.gsettings-desktop-schemas}/share/gsettings-schemas/${pkgs.gsettings-desktop-schemas.name}"
  ];

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

  home.file.".config/xdg-desktop-portal/hyprland-portals.conf".text = ''
    [preferred]
    default=hyprland;gtk
    org.free.impl.portal.FileChooser=kde
  '';


  # Place Files Inside Home Directory
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
