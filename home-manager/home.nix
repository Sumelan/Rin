{ inputs, pkgs, ... }:
let
  colors = import ./cols/vixima.nix { };
in
{
  imports = [
    inputs.nixvim.homeManagerModules.nixvim
    ./modules/bundle.nix { inherit colors; }
  ];

# Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home = {
    username = "bathys";
    homeDirectory = "/home/bathys";
    packages = with pkgs; [
      (pkgs.callPackage ../nixos/icons/papirus.nix { })
      (pkgs.callPackage ../nixos/others/phocus.nix { inherit colors; })
    ];
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

  home.stateVersion = "23.11";
}
