{pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [  ];
  boot.loader = {
   # systemd-boot.enable = true;
    timeout = 5;
    efi.efiSysMountPoint = "/boot";
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      version = 2;
      efiSupport = true;
      efiInstallAsRemovable = true;
      devices = [ "nodev" ];
      extraEntriesBeforeNixOS = true;
      extraEntries = ''
        menuentry = "Reboot" {
          reboot
        }
        menuentry = "Poweroff" {
          halt
        }
        '';
    };
  };
}
