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
          rosewater = mkLiteral "#f4dbd6";
          flamingo = mkLiteral "#f0c6c6";
          pink = mkLiteral "#f5bde6";
          mauve = mkLiteral "#c6a0f6";
          red = mkLiteral "#ed8796";
          maroon = mkLiteral "#ee99a0";
          peach = mkLiteral "#f5a97f";
          yellow = mkLiteral "#eed49f";
          green = mkLiteral "#a6da95";
          teal = mkLiteral "#8bd5ca";
          sky = mkLiteral "#91d7e3";
          sapphire = mkLiteral "#7dc4e4";
          blue = mkLiteral "#8aadf4";
          lavender = mkLiteral "#b7bdf8";
          text = mkLiteral "#cad3f5";
          subtext1 = mkLiteral "#b8c0e0";
          subtext0 = mkLiteral "#a5adcb";
          overlay2 = mkLiteral "#939ab7";
          overlay1 = mkLiteral "#8087a2";
          overlay0 = mkLiteral "#6e738d";
          surface2 = mkLiteral "#5b6078";
          surface1 = mkLiteral "#494d64";
          surface0 = mkLiteral "#363a4f";
          base = mkLiteral "#24273a";
          mantle = mkLiteral "#1e2030";
          crust = mkLiteral "#181926";
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
          background-color = mkLiteral "@base";
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
          background-color = "@surface2";
          text-color = mkLiteral "@surface0";
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
          text-color = mkLiteral "@subtext1";
        };
        "button" = {
          padding = mkLiteral "20px";
          border-radius = mkLiteral "10px";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@subtext1";
          cursor = mkLiteral "pointer";
        };
        "button selected" = {
          background-color = mkLiteral "@overlay0";
          text-color = mkLiteral "@green";
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
          text-color = mkLiteral "@subtext0";
          cursor = mkLiteral "default";
        };
        "element" = {
          enabled = true;
          spacing = mkLiteral "15px";
          padding = mkLiteral "10px";
          border-radius = "10px";
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@subtext1";
          cursor = mkLiteral "pointer";
        };
        "element normal.normal" = {
          background-color = mkLiteral "inherit";
          text-color = mkLiteral "inherit";
        };
        "element normal.urgent" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@red";
        };
        "element normal.active" = {
          background-color = mkLiteral "transparent";
          text-color = mkLiteral "@blue";
        };
        "element selected.normal" = {
          background-color = mkLiteral "@surface2";
          text-color = mkLiteral "@maroon";
        };
        "element selected.urgent" = {
          background-color = mkLiteral "@surface2";
          text-color = mkLiteral "@red";
        };
        "element selected.active" = {
          background-color = mkLiteral "@surface2";
          text-color = mkLiteral "@blue";
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
          background-color = mkLiteral "@surface2";
          text-color = mkLiteral "@subtext0";
          vertical-align = mkLiteral "0.5";
          horizontal-align = mkLiteral "0.0";
        };
        "error-message" = {
          padding = mkLiteral "15px";
          border-radius = mkLiteral "20px";
          background-color = mkLiteral "@yellow";
          text-color = mkLiteral "@base";
        };
      };
    };
}
