{ pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./desktop/amd-drivers.nix
      ./packages/packages.nix
      ./japanese-input.nix
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

# Power management.
  powerManagement = {
	  enable = true;
  };

  # flatpak
  services.flatpak.enable = true;

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

  # Enableing flakes and optimize store.
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  # Set system version.
  system.stateVersion = "23.11";
}
