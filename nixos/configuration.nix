{ config, ... }:

{
  imports = [
  # Include the results of the hardware scan.
      ./hardware-configuration.nix
　　　 ./packages.nix
      ./modules/bundle.nix
      ./disko-config.nix
    ];
  
  disableModules = [
      ./modules/xserver.nix
  ];

  # Define your hostname. 
  networking.hostName = "BathyScarfOS";

  # Set your time zone.
  time.timeZone = "Asia/Tokyo";

  # Select internationalisation properties.
  i18n.defaultLocale = "ja_JP.UTF-8";
  i18n.inputMethod = {
   enabled = "fcitx5";
   fcitx5.addons = [pkgs.fcitx5-mozc];
  };

  # Enableing flakes.
  nix.settings.experimental-features = ["nix-command" "flakes" ];

  # Set system version.
  system.stateVersion = "23.11";

}

