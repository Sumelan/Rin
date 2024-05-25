{
  programs = {
    hyprland.enable = true;
    xwayland.enable = true;
    dconf.enable = true;
    waybar.enable = true;
  };
  xdg.portal = {
    enable = true;
    extraPortals = with pkgs; [
      xdg-desktop-portal-gtk
	    xdg-desktop-portal-hyprland
    ];
  };
}
