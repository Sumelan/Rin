{ pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./amd/amd-drivers.nix
      ./pkgs/packages.nix
      ./fonts/fonts.nix
      ./modules/bundle.nix
      ./disko-config.nix
  ];

  # Define your hostname.
  networking.hostName = "Rin";

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "ja_JP.UTF-8";
  i18n.extraLocaleSettings = {
      LC_ADDRESS = "ja_JP.UTF-8";
      LC_IDENTIFICATION = "ja_JP.UTF-8";
      LC_MEASUREMENT = "ja_JP.UTF-8";
      LC_MONETARY = "ja_JP.UTF-8";
      LC_NAME = "ja_JP.UTF-8";
      LC_NUMERIC = "ja_JP.UTF-8";
      LC_PAPER = "ja_JP.UTF-8";
      LC_TELEPHONE = "ja_JP.UTF-8";
      LC_TIME = "ja_JP.UTF-8";
    };

  # Input methods.
  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
    ];
  };

# Power management.
  powerManagement = {
	  enable = true;
  };

# Extra Module Options
  drivers.amdgpu.enable = true;

  #Add ~/.local/bin/ to $PATH
  environment.localBinInPath = false;

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Enableing flakes and optimize store.
  nix.settings = {
    auto-optimise-store = true;
    experimental-features = [ "nix-command" "flakes" ];
    substituters = [ "https://hyprland.cachix.org" ];
    trusted-public-keys = [ "hyprland.cachix.org-1:a7pgxzMz7+chwVL3/pzj6jIBMioiJM7ypFP8PwtkuGc=" ];
  };

# Overlays.
  nixpkgs.overlays = [ 
    (final: prev: {
      luajit = prev.luajit.override {
        packageOverrides = luafinal: luaprev: {
          # https://github.com/NixOS/nixpkgs/issues/333761
          dkjson = luaprev.dkjson.overrideAttrs (finalAttrs: prevAttrs: {
            src = final.fetchurl {
              inherit (prevAttrs.src) url;
              hash = "sha256-JOjNO+uRwchh63uz+8m9QYu/+a1KpdBHGBYlgjajFTI=";
            };
          });
         };
      };

      luajitPackages = final.luajit.pkgs;
    })
  ];

  # Set system version.
  system.stateVersion = "23.11";
}
