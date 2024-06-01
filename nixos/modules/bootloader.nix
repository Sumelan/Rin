{pkgs, ... }:
{
  boot.kernelPackages = pkgs.linuxPackages_latest;
  boot.kernelParams = [  ];
  boot.loader = {
   # systemd-boot.enable = true;
    efi.canTouchEfiVariables = true;
    grub = {
      enable = true;
      devices = [ "nodev" ];
      efiSupport = true;
      gfxmodeBios = "auto";
        memtest86.enable = true;
        extraGrubInstallArgs = [ "--bootloader-id=NixOS" ];
        configurationName = "NixOS";
    };
    timeout = 5;
  };
}
