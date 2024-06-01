{inputs, theme, ... }:
{
  colorScheme = inputs.nix-colors.colorSchemes."${theme}";

  imports = [
    ./zsh.nix
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    inputs.hyprland.homeManagerModules.default
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
    starship = {
      enable = true;
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

# Place Files Inside Home Directory
  home.file.".config/wlogout/icons" = {
    source = ./modules/wms/wlogout;
    recursive = true;
  };
  home.file.".config/rofi/wallpapers" = {
    source = ./modules/wms/rofi;
    recursive = true;
  };
  home.file.".config/waybar" = {
    source = ./modules/wms/waybar;
    recursive = true;
  };

  home.stateVersion = "23.11";
}
