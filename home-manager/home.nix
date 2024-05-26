{inputs, lib, config, pkgs, theme, gtkThemeFromScheme, ... }:
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
    stateVersion = "23.11";
  };

  programs.starship = {
    enable = true;
  };
}
