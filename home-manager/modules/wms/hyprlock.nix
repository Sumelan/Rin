{
programs.hyprlock = {
      enable = true;
      settings = {
        general = {
          disable_loading_bar = true;
          grace = 10;
          hide_cursor = true;
          no_fade_in = false;
        };
        background = [
          {
            path = "screenshot";
            blur_passes = 2;
            blur_size = 6;
            noise = 0.0117;
            contrast = 1.3000; # Vibrant!!!
            brightness = 0.8000;
            vibrancy = 0.2100;
            vibrancy_darkness = 0.0;
          }
        ];
        input-field = [
        {    monitor = "";
             size = "250, 50";
             outline_thickness = 3;
             dots_size = 0.33; # Scale of input-field height, 0.2 - 0.8
             dots_spacing = 0.15; # Scale of dots' absolute size, 0.0 - 1.0
             dots_center = true;
             outer_color = "rgb(24, 25, 38)";
             inner_color = "rgb(91, 96, 120)";
             font_color = "rgb(202, 211, 245)";
             fade_on_empty = true;
             placeholder_text = "Password..."; # Text rendered in the input box when it's empty.
             hide_input = false;
    
             position = "0, 200";
             halign = "center";
             valign = "bottom";
       }
       ];
      };
    };
}
