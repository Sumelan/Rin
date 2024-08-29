{ pkgs, ... }: 
{
  hardware.sane = {
    enable = true;
    extraBackends = [ pkgs.sane-airscan ];
    disabledDefaultBackends = [ "escl" ];
  };
  # Extra Logitech Support
  hardware.logitech.wireless.enable = true;
  hardware.logitech.wireless.enableGraphical = true;
  # OpenGL
  hardware.graphics = {
   enable = true;
  };

  # trim
  services.fstrim.enable = true;

  # zram
  zramSwap = {
    enable = true;
    algorithm = "zstd";
    memoryPercent = 100;
    priority = 100;
   swapDevices = 1;
  };
}
