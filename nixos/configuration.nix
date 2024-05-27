{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./packages.nix
      ./modules/bundle.nix
      ./disko-config.nix
    ];
  
  disabledModules = [
      ./modules/xserver.nix
  ];

  # Define your hostname. 
  networking.hostName = "BathyScarfOS";

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

  # Japanese input.
  i18n.inputMethod = {
   enabled = "fcitx5";
   fcitx5.addons = with pkgs; [
     fcitx5-mozc
   ];
  };

### Laptop Specifycation
# Power management.
  powerManagement = {
	  enable = true;
  }; 

services = {
   thermald.enable = true;
   tlp.enable = true;
};

# Sleep, Hibernate, etc.
  systemd.sleep.extraConfig = ''
    AllowSuspend=yes
    AllowHibernation=yes
    AllowHybridSleep=no
    AllowSuspendThenHibernate=no
'';

# don’t shutdown when power button is short-pressed.
  services.logind.extraConfig = ''
      HandlePowerKey = ignore
    '';

  # flatpak
  services.flatpak.enable = true;

  # Security
  security = {
    pam.services.swaylock.text = "auth include login";
    polkit.enable = true;
    rtkit.enable = true;
  };

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
