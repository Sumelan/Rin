{ pkgs, config, ... }: 
let
  theme = config.colorScheme.palette;
in
{
  programs.swaylock = {
    package = pkgs.swaylock-effects;
    settings = {
      image = "/home/bathys/.config/swaylock/lockscreen/lockscreen.png";
      clock = true;
      color = "00000000";
      font = "Product Sans";
      show-failed-attempts = false;
      indicator = true;
      indicator-radius = 220;
      indicator-thickness = 25;
      line-color = "#${theme.base0D}";
      ring-color = "#${theme.base0C}";
      inside-color = "#${theme.base06}";
      key-hl-color = "#${theme.base09}";
      separator-color = "00000000";
      text-color = "#${theme.base05}";
      text-caps-lock-color = "";
      line-ver-color = "#${theme.base0A}";
      ring-ver-color = "#${theme.base0A}";
      inside-ver-color = "#17181C";
      text-ver-color = "#e4e5e7";
      ring-wrong-color = "#${theme.base08}";
      text-wrong-color = "#${theme.base08}";
      inside-wrong-color = "#${theme.base0C}";
      inside-clear-color = "#${theme.base0C}";
      text-clear-color = "#e4e5e7";
      ring-clear-color = "#A771EF";
      line-clear-color = "#${theme.base09}";
      line-wrong-color = "#${theme.base09}";
      bs-hl-color = "#${theme.base0B}";
      line-uses-ring = false;
      grace = 0;
      grace-no-mouse = true;
      grace-no-touch = true;
      datestr = "%d.%m";
      fade-in = "0.1";
      ignore-empty-password = true;
    };
  };

}
