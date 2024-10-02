{ config, lib, pkgs, ... }:
{
  services.zfs = {
        autoScrub.enable = true;
        trim.enable = true;
  };


}
