{ pkgs, ... }:
{
  programs = {
    neovim.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    starship.enable = true;
    dconf.enable = true;
    nm-applet.enable = true;
    steam.enable = true;
    virt-manager.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
        thunar-media-tags-plugin
      ];
    };
    file-roller.enable = true;
    kdeconnect.enable = true;
  };
}
