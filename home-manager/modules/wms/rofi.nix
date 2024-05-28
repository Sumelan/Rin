{ config, pkgs, modulesPath, ... }: 
let
  inherit (config.colorscheme) palette;
in {
  programs.rofi = {
    enable = true;
    package = pkgs.rofi.override {
      plugins = [pkgs.rofi-emoji];
    };

    theme = let
      inherit (config.lib.formats.rasi) mkLiteral;
    in {
      "configuration" = {
        modi = "drun, run, filebrower";
        show-icons = true;
        display-drun = "Apps";
        display-run = "Run";
        display-filebrowser = "Files";
        display-window = "Windows";
        drun-display-format = "{name}";
        hover-select = true;
      	me-select-entry = "MouseSecondary";
        me-accept-entry = "MousePrimary";
        window-format = "{w} · {c} · {t}";
      };

      "*" = with palette; {
        font = "monospace bold 14";
        background = mkLiteral "#${base00}ff";
        background-alt = mkLiteral "#${base01}ff";
        foreground = mkLiteral "#${base05}ff";
        selected = mkLiteral "#${base0D}ff";
        active = mkLiteral "#${base0B}ff";
        urgent = mkLiteral "#${base08}ff";

        border-colour = mkLiteral "var(selected)";
        handle-colour = mkLiteral "var(selected)";
        background-colour = mkLiteral "var(background)";
        foreground-colour = mkLiteral "var(foreground)";
        alternate-background = mkLiteral "var(background-alt)";
        normal-background = mkLiteral "var(background-alt)";
        normal-foreground = mkLiteral "var(foreground)";
        urgent-background = mkLiteral "var(urgent)";
        urgent-foreground = mkLiteral "var(background)";
        active-background = mkLiteral "var(active)";
        active-foreground = mkLiteral "var(background)";
        selected-normal-background = mkLiteral "var(selected)";
        selected-normal-foreground = mkLiteral "var(background)";
        selected-urgent-background = mkLiteral "var(active)";
        selected-urgent-foreground = mkLiteral "var(background)";
        selected-active-background = mkLiteral "var(urgent)";
        selected-active-foreground = mkLiteral "var(background)";
        alternate-normal-background = mkLiteral "var(background-alt)";
        alternate-normal-foreground = mkLiteral "var(foreground)";
        alternate-urgent-background = mkLiteral "var(urgent)";
        alternate-urgent-foreground = mkLiteral "var(background)";
        alternate-active-background = mkLiteral "var(active)";
        alternate-active-foreground = mkLiteral "var(background)";
      };

      # Main window
      "window" = {
        "transparency" = "real";
        "location" = mkLiteral "center";
        "anchor" = mkLiteral "center";
        "fullscreen" = mkLiteral "false";
        "width" = mkLiteral "50%";
        "x-offset" = mkLiteral "0px";
        "y-offset" = mkLiteral "0px";

        # properties for all widgets
        "enabled" = mkLiteral "true";
        "margin" = mkLiteral "0px";
        "padding" = mkLiteral "0px";
        "border" = mkLiteral "2px solid";
        "border-radius" = mkLiteral "30px";
        "border-color" = mkLiteral "@border-colour";
        "cursor" = "default";
        "background-color" = mkLiteral "@background-colour";
      };

      # Main box
      "mainbox" = {
        "enabled" = mkLiteral "true";
        "orientation"= mkLiteral "vertical";
        "spacing" = mkLiteral "10px";
        "margin" = mkLiteral "0px";
        "padding" = mkLiteral "10px";
        "border" = mkLiteral "0px solid";
        "border-radius" = mkLiteral "0px 0px 0px 0px";
        "border-color" = mkLiteral "@border-colour";
        "background-color" = mkLiteral "transparent";
        "children" = mkLiteral "[ inputbar, listbox]";
      };

      # Inputbar
      "inputbar" = {
        "enabled" = mkLiteral "true";
        "spacing" = mkLiteral "10px";
        "margin" = mkLiteral "10px";
        "padding" = mkLiteral "10px 10px 100px 10px";
        "border" = mkLiteral "0px";
        "border-radius" = mkLiteral "25px";
        "border-color" = mkLiteral "@border-colour";
        "background-color" = mkLiteral "@background-colour";
        "text-color" = mkLiteral "@foreground-colour";
        "orientation" = mkLiteral "horizontal";
        "children" = mkLiteral "[ entry, dummy, mode-switcher ]";
        "background-image" = modulesPath "url("home/bathys/.config/rofi/wallpapers/nix-girl.png", width)";

      };
      "prompt" = {
        "enabled" = mkLiteral "true";
        "background-color" = mkLiteral "@background-alt";
        "padding" = mkLiteral "2px 14px 4px 14px";
        "text-color" = mkLiteral "inherit";
      };
      "entry" = {
        "enabled" = mkLiteral "true";
        "margin" = mkLiteral "8px 0px 0px 14px";
        "background-color" = mkLiteral "inherit";
        "text-color" = mkLiteral "inherit";
        "cursor" = mkLiteral "text";
        "placeholder" = "Search...";
        "placeholder-color" = mkLiteral "inherit";
      };

     # Listbox
      "listbox" = {
        "spacing" = mkLiteral "10px";
        "padding" = mkLiteral "10px";
        "background-color" = mkLiteral "transparent";
        "orientation" = mkLiteral "vertical";
        "children" = mkLiteral "[ message, listview ]";
     };

      # Listview
      "listview" = {
        "enabled" = mkLiteral "true";
        "columns" = mkLiteral "2";
        "lines" = mkLiteral "6";
        "cycle" = mkLiteral "true";
        "dynamic" = mkLiteral "true";
        "scrollbar" = mkLiteral "true";
        "layout" = mkLiteral "vertical";
        "reverse" = mkLiteral "false";
        "fixed-height" = mkLiteral "false";
        "fixed-columns" = mkLiteral "true";

        "spacing" = mkLiteral "10px";
        "margin" = mkLiteral "0px";
        "padding" = mkLiteral "0px";
        "border" = mkLiteral "0px solid";
        "border-radius" = mkLiteral "0px";
        "border-color" = mkLiteral "@border-colour";
        "background-color" = mkLiteral "transparent";
        "text-color" = mkLiteral "@foreground-colour";
        "cursor" = "default";
      };

       # Dummy
        "dummy" = {
          "expand" = mkLiteral "true";
          "background-color" = mkLiteral "transparent";
         };

       # Mode Switcher
       "mode-switcher" = {
         "enabled" = mkLiteral "true";
         "spacing" = mkLiteral "10px";
         "background-color" = mkLiteral "transparent";
       };
       "button" = {
         "width" = mkLiteral "5%";
         "padding" = mkLiteral "12px";
         "border-radius" = mkLiteral "12px";
         "background-color" = mkLiteral "@text-selected";
         "text-color" = mkLiteral "@text-color";
        "cursor" = mkLiteral "pointer";
       };
       "button selected" = {
         "background-color" =  mkLiteral "@selected";
         "text-color" = mkLiteral "@text-selected";
       };

       # Scrollbar
       "scrollbar" = {
          "width" = mkLiteral "4px";
          "border" = mkLiteral "0px";
          "handle-color" = mkLiteral "@border-color";
          "handle-width" = mkLiteral "8px";
          "padding" = mkLiteral "0px";
       };

      # Element
      "element" = {
        "enabled" = mkLiteral "true";
        "spacing" = mkLiteral "10px";
        "margin" = mkLiteral "0px";
        "padding" = mkLiteral "10px";
        "border" = mkLiteral "0px solid";
        "border-radius" = mkLiteral "12px";
        "border-color" = mkLiteral "@border-colour";
        "background-color" = mkLiteral "transparent";
        "text-color" = mkLiteral "@foreground-colour";
        "cursor" = mkLiteral "pointer";
      };
      "element normal.normal" = {
        "background-color" = mkLiteral "var(normal-background)";
        "text-color" = mkLiteral "var(normal-foreground)";
      };
      "element normal.urgent" = {
        "background-color" = mkLiteral "var(urgent-background)";
        "text-color" = mkLiteral "var(urgent-foreground)";
      };
      "element normal.active" = {
        "background-color" = mkLiteral "var(active-background)";
        "text-color" = mkLiteral "var(active-foreground)";
      };
      "element selected.normal" = {
        "background-color" = mkLiteral "var(selected-normal-background)";
        "text-color" = mkLiteral "var(selected-normal-foreground)";
      };
      "element selected.urgent" = {
        "background-color" = mkLiteral "var(selected-urgent-background)";
        "text-color" = mkLiteral "var(selected-urgent-foreground)";
      };
      "element selected.active" = {
        "background-color" = mkLiteral "var(selected-active-background)";
        "text-color" = mkLiteral "var(selected-active-foreground)";
      };
      "element alternate.normal" = {
        "background-color" = mkLiteral "var(alternate-normal-background)";
        "text-color" = mkLiteral "var(alternate-normal-foreground)";
      };
      "element alternate.urgent" = {
        "background-color" = mkLiteral "var(alternate-urgent-background)";
        "text-color" = mkLiteral "var(alternate-urgent-foreground)";
      };
      "element alternate.active" = {
        "background-color" = mkLiteral "var(alternate-active-background)";
        "text-color" = mkLiteral "var(alternate-active-foreground)";
      };
      "element-icon" = {
        "background-color" = mkLiteral "transparent";
        "text-color" = mkLiteral "inherit";
        "size" = mkLiteral "24px";
        "cursor" = mkLiteral "inherit";
      };
      "element-text" = {
        "background-color" = mkLiteral "transparent";
        "text-color" = mkLiteral "inherit";
        "highlight" = mkLiteral "inherit";
        "cursor" = mkLiteral "inherit";
        "vertical-align" = mkLiteral "0.5";
        "horizontal-align" = mkLiteral "0.0";
      };
    };
  };
}
