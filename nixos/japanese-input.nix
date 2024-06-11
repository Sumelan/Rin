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
      #GTK_IM_MODULE = "fcitx";
      GTK_IM_MODULE = "wayland";
      QT_IM_MODULE = "fcitx";
      XMODIFIERS = "@im=fcitx";
      SDL_IM_MODULE = "fcitx";
      GLFW_IM_MODULE = "ibus";
    };
  };
}


