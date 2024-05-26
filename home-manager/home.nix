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
    stateVersion = "23.11";
  };
programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "bathys";
      userEmail = "68154148+bathys@users.noreply.github.com";
    };
    starship = {
      enable = true;
    };
  };
}
