{ config, pkgs, ... }:
{
  programs.rofi = {
    enable = true;
    package = pkgs.rofi-wayland;
    font = "Iosevka Nerd Font 12";
    extraConfig = {
      modi = "drun";
      display-drun = "";
      show-icons = true;
      drun-display-format = "{name}";
      sidebar-mode = false;
    };
    theme = 
      let
        inherit (config.lib.formats.rasi) mkLiteral;
      in
      {
        "*" = {
          bg = mkLiteral "#${config.stylix.base16Scheme.base00}";
          bg-alt = mkLiteral "#${config.stylix.base16Scheme.base09}";
          foreground = mkLiteral "#${config.stylix.base16Scheme.base01}";
          selected = mkLiteral "#${config.stylix.base16Scheme.base08}";
          active = mkLiteral "#${config.stylix.base16Scheme.base0B}";
          text-selected = mkLiteral "#${config.stylix.base16Scheme.base00}";
          text-color = mkLiteral "#${config.stylix.base16Scheme.base05}";
          border-color = mkLiteral "#${config.stylix.base16Scheme.base0F}";
          urgent = mkLiteral "#${config.stylix.base16Scheme.base0E}";
        };
        "window" = {
          transparency = "real";
          location = mkLiteral "north west";
          anchor = mkLiteral "north west";
          fullscreen = false;
          width = mkLiteral "360px";
          x-offset = mkLiteral "290px";
          y-offset = mkLiteral "20px";
          enabled = true;
          border-radius = mkLiteral "15px";
          cursor = mkLiteral "default";
          background-color = mkLiteral "@bg";
        };
        "mainbox" = {
          enabled = true;
          spacing = mkLiteral "0px";
          background-color = mkLiteral "transparent";
          orientation = mkLiteral "horizontal";
          children = map mkLiteral [ 
           "listbox"
          ];
        };
        "listbox" = {
          spacing = mkLiteral "5px";
          padding = mkLiteral "10px";
          background-color = mkLiteral "transparent";
          orientation = mkLiteral "vertical";
          children = map mkLiteral [
            "inputbar" 
            "message"
            "listview"
          ];
        };
        "dummy" = {
          background-color = mkLiteral "transparent";
        };
        "inputbar" = {
          enabled = true;
          spacing = mkLiteral "10px";
          padding = mkLiteral "10px";
          border-radius = mkLiteral "10px";
          background-color = "@bg-alt";
          text-color = mkLiteral "@text-selected";
          children = map mkLiteral [
            "textbox-prompt-colon"
            "entry"
          ];
        };
        "textbox-prompt-colon" = {
          enabled = true;
          expand = false;
          str = "  ";
          font = "Iosevka Nerd Font 12";
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        "entry" = {
          enabled = true;
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "text";
          placeholder = "Search";
          placeholder-color = mkLiteral "inherit";
        };
        "mode-switcher" = {
          enabled = true;
          spacing = mkLiteral "20px";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@text-color";
        };
        "button" = {
          padding = mkLiteral "20px";
          border-radius = mkLiteral "10px";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@text-color";
          cursor = mkLiteral "pointer";
        };
        "button selected" = {
          background-color = mkLiteral "@bg-alt";
          text-color = mkLiteral "@text-color";
        };
        "listview" = {
          enabled = true;
          columns = 1;
          lines = 6;
          cycle = true;
          dynamic = true;
          scrollbar = false;
          layout = mkLiteral "vertical";
          reverse = false;
          fixed-height = true;
          fixed-columns = true;
          spacing = mkLiteral "5px";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@text-color";
          cursor = mkLiteral "default";
        };
        "element" = {
          enabled = true;
          spacing = mkLiteral "15px";
          padding = mkLiteral "10px";
          border-radius = "10px";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@text-color";
          cursor = mkLiteral "pointer";
        };
        "element normal.normal" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        "element normal.urgent" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@urgent";
        };
        "element normal.active" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@active";
        };
        "element selected.normal" = {
          background-color = mkLiteral "@bg-alt";
          text-color = mkLiteral "@text-selected";
        };
        "element selected.urgent" = {
          background-color = mkLiteral "@bg-alt";
          text-color = mkLiteral "@urgent";
        };
        "element selected.active" = {
          background-color = mkLiteral "@bg-alt";
          text-color = mkLiteral "@active";
        };
        "element-icon" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          size = mkLiteral "32px";
          cursor = mkLiteral "inherit";
        };
        "element-text" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "inherit";
          cursor = mkLiteral "inherit";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };
        "message" = {
          background-color = mkLiteral "transparent";
          border = mkLiteral "0px";
        };
        "textbox" = {
          padding = mkLiteral "15px";
          border-radius = mkLiteral "10px";
          background-color = mkLiteral "@bg-alt";
          text-color = mkLiteral "@text-color";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };
        "error-message" = {
          padding = mkLiteral "15px";
          border-radius = mkLiteral "20px";
          background-color = mkLiteral "@bg-alt";
          text-color = mkLiteral "@text-color";
        };
      };
    };
}
