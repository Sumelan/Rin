{ inputs, pkgs, ... }:
let
  colors = import ./cols/vixima.nix { };
in
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
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
  
  packages = with pkgs; [
    (pkgs.callPackage ../nixos/pkgs/icons/papirus.nix { })
    (pkgs.callPackage ../nixos/pkgs/others/phocus.nix { inherit colors; })
  ];

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

  home.stateVersion = "23.11";
}
