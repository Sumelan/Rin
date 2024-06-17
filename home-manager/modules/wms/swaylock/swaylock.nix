{ pkgs, ... }: {
  programs.swaylock = {
    package = pkgs.swaylock-effects;
    settings = {
      clock = true;
      color = "00000000";
      font = "Product Sans";
      show-failed-attempts = false;
      indicator = true;
      indicator-radius = 220;
      indicator-thickness = 25;
      line-color = "#17181C";
      ring-color = "#1E1F24";
      inside-color = "#17181C";
      key-hl-color = "#FA3867";
      separator-color = "00000000";
      text-color = "#e4e5e7";
      text-caps-lock-color = "";
      line-ver-color = "#FA3867";
      ring-ver-color = "#FA3867";
      inside-ver-color = "#17181C";
      text-ver-color = "#e4e5e7";
      ring-wrong-color = "#FA3867";
      text-wrong-color = "#FA3867";
      inside-wrong-color = "#17181C";
      inside-clear-color = "#17181C";
      text-clear-color = "#e4e5e7";
      ring-clear-color = "#A771EF";
      line-clear-color = "#17181C";
      line-wrong-color = "#17181C";
      bs-hl-color = "#FA3867";
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
