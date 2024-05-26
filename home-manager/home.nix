{inputs, lib, config, pkgs, theme, gtkThemeFromScheme, ... }:
{
  colorScheme = inputs.nix-colors.colorSchemes."${theme}";

  imports = [
    ./zsh.nix
    inputs.nix-colors.homeManagerModules.default
    inputs.nixvim.homeManagerModules.nixvim
    ./modules/bundle.nix
  ];

# Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home = {
    username = "bathys";
    homeDirectory = "/home/bathys";
  };
  dconf.settings = {
    "org/virt-manager/virt-manager/connections" = {
      autoconnect = [ "qemu:///system" ];
      uris = [ "qemu:///system" ];
    };
  };
  programs = {
    home-manager.enable = true;
    starship = {
      enable = true;
    };
  };

  home.stateVersion = "23.11";
}
