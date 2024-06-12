{pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxKernel.packages.linux_6_8;
  boot.kernelParams = [  ];
  boot.loader = {
   # systemd-boot.enable = true;
    timeout = 5;
    efi.efiSysMountPoint = "/boot";
    grub = {
      enable = true;
      efiSupport = true;
      efiInstallAsRemovable = true; #Otherwise /boot/EFI/BOOT/BOOTX64.EFI isn't generate.
      devices = [ "nodev" ];
      extraEntriesBeforeNixOS = true;
      extraEntries = ''
        menuentry "Reboot" {
          reboot
        }
        menuentry "Poweroff" {
          halt
        }
        '';
    };
  };
}
