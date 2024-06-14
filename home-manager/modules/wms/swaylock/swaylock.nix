{
  programs.swaylock = {
    enable = true;
    settings = {
      image = "/home/bathys/.config/swaylock/lockscreen/lockscreen.png";
      indicator-idle-visible = false;
      indicator-radius = 100;
      indicator-thickness = 20;
      show-failed-attempts = true;

      bs-hl-color = "#f38ba8";
      color = "#1e1e2e28";
      key-hl-color = "#cba6f7";

      caps-lock-bs-hl-color = "#f38ba8";
      caps-lock-key-hl-color = "#cba6f7";

      inside-color = "#1e1e2e28";
      inside-clear-color = "#1e1e2e";
      inside-caps-lock-color = "#1e1e2e";
      inside-ver-color = "#1e1e2e";
      inside-wrong-color = "#1e1e2e";

      line-color = "#1e1e2e";
      line-clear-color = "#1e1e2e";
      line-caps-lock-color = "#1e1e2e";
      line-ver-color = "#1e1e2e";
      line-wrong-color = "#1e1e2e";

      ring-color = "#11111b";
      ring-clear-color = "#11111b";
      ring-caps-lock-color = "#11111b";
      ring-ver-color = "#11111b";
      ring-wrong-color = "#11111b";

      separator-color = "#00000000";

      text-color = "#cdd6f4";
      text-clear-color = "#cdd6f4";
      text-caps-lock-color = "#cdd6f4";
      text-ver-color = "#cdd6f4";
      text-wrong-color = "#cdd6f4";
    };
  };

  # Place Files Inside Home Directory
  home.file.".config/swaylock/lockscreen" = {
    source = ./lockscreen;
    recursive = true;
  };
}
