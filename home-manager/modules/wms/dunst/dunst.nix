{ pkgs, config, ... }:
let
  theme = config.colorScheme.palette;
in
{
  services.dunst = {
    enable = true;
    settings = {
      global = {
        allow_markup = true;
        font = "Open Sans 10";
        corner_radius = 28;
        fade_in_duration = 400;
        frame = 10000;
        frame_width = 2;
        icon_corner_radius = 7;
        monitor = 1;
        offset = "20x20";
        origin = "bottom-right";
        progress_bar_corner_radius = 7;
        timeout = 10;
        transparecncy = true;
        # Colours
        background = "#${theme.base02}";
        foreground = "#${theme.base05}";
        frame_color = "#${theme.base06}";
      };
      shortcuts = {
        context = "ctrl+shift+period";
        open = "super+o";
      };
    };
  };
}
