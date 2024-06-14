{pkgs, lib, ... }:
{
  i18n.inputMethod = {
    enabled = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-mozc
    ];
  };
  lib.mkForce = {
    environment.variables = {
      GTK_IM_MODULE = "fcitx5";
      QT_IM_MODULE = "fcitx5";
      XMODIFIERS = "@im=fcitx5";
    };
  };
}


