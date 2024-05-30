{ config, pkgs, ... }:

{
  imports = [
      ./hardware-configuration.nix
      ./packages.nix
      ./intel-drivers.nix
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
    AllowHybridSleep=yes
    AllowSuspendThenHibernate=yes
'';

# hybrid sleep when press power button
  services.logind.extraConfig = ''
    HandlePowerKey=suspend
    IdleAction=suspend
    IdleActionSec=1m
  '';

  # flatpak
  services.flatpak.enable = true;

  # Security / Polkit
  security = {
    pam.services.swaylock.text = "auth include login";
    rtkit.enable = true;
    polkit.enable = true;
    polkit.extraConfig = ''
    polkit.addRule(function(action, subject) {
      if (
        subject.isInGroup("users")
          && (
            action.id == "org.freedesktop.login1.reboot" ||
            action.id == "org.freedesktop.login1.reboot-multiple-sessions" ||
            action.id == "org.freedesktop.login1.power-off" ||
            action.id == "org.freedesktop.login1.power-off-multiple-sessions"
            action.id == "org.freedesktop.login1.suspend" ||
            action.id == "org.freedesktop.login1.hibernate" ||
          )
        )
      {
        return polkit.Result.YES;
      }
    })
  '';
    sudo.wheelNeedsPassword = false;
  };

  # Automatic Garbage Collection
  nix.gc = {
    automatic = true;
    dates = "weekly";
    options = "--delete-older-than 7d";
  };

 # OpenGL
  hardware.opengl = {
    enable = true;
    driSupport = true;
    driSupport32Bit = true;
  };

  services = {
    displayManager.sddm = {
        enable = true;
        autoNumlock = true;
        wayland.enable = true;
        theme = "sugar-dark";
      };
    xserver = {
      enable = true;
      desktopManager.cinnamon.enable = false;
        xkb = {
          layout = "us";
          variant = "";
       };
     };
};
  # Enableing flakes and optimize store.
  nix.settings = {
    experimental-features = [ "nix-command" "flakes" ];
    auto-optimise-store = true;
  };

  # Set system version.
  system.stateVersion = "23.11";
}
