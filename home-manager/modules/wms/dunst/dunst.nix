<<<<<<< HEAD
{  pkgs, ... }:
{
=======
{ colors, pkgs, ... }: with colors;{
>>>>>>> f3ed4109dabca9fdcaaf93be377627a875834fd1
  services.dunst = {
    enable = true;
    settings = {
      global = {
        follow = "mouse";
        width = "(180,500)";
        origin = "bottom-center";
        alignment = "left";
        vertical_alignment = "center";
        ellipsize = "middle";
        offset = "0x45";
        padding = 15;
        horizontal_padding = 15;
        text_icon_padding = 15;
        icon_position = "left";
        min_icon_size = 48;
        max_icon_size = 64;
        highlight = "#FA3867";
        progress_bar = true;
        progress_bar_height = 12;
        progress_bar_frame_width = 1;
        progress_bar_min_width = 150;
        progress_bar_max_width = 300;
        separator_height = 2;
        frame_width = 2;
        frame_color = "#1E1F24";
        separator_color = "frame";
        corner_radius = 3;
        transparency = 0;
        gap_size = 8;
        line_height = 0;
        notification_limit = 0;
        idle_threshold = 120;
        history_length = 20;
        show_age_threshold = 60;
        markup = "full";
        font = "Product Sans 12";
        format = "<b>%s</b>\n%b";
        word_wrap = "yes";
        sort = "yes";
        shrink = "no";
        indicate_hidden = "yes";
        sticky_history = "yes";
        ignore_newline = "no";
        show_indicators = "no";
        stack_duplicates = true;
        always_run_script = true;
        hide_duplicate_count = false;
        icon_theme = "reversal";
        ignore_dbusclose = false;
        force_xwayland = false;
        force_xinerama = false;
        mouse_left_click = "do_action";
        mouse_middle_click = "close_all";
        mouse_right_click = "close_current";
      };

      fullscreen_delay_everything = { fullscreen = "delay"; };
      urgency_low = {
        timeout = 8;
        background = "#17181C";
        foreground = "#e4e5e7";
        highlight = "#FA3867";
      };
      urgency_normal = {
        timeout = 8;
        background = "#17181";
        foreground = "#e4e5e7";
        highlight = "#1E1F24";
      };
      urgency_critical = {
        timeout = 10;
        background = "#17181";
        foreground = "#e4e5e7";
        highlight = "#FA3867";
      };
    };
  };
}
