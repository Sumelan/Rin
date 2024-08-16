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
  };
  xdg.configFile."rofi/config.rasi".text = ''
    configuration {
    	modi:                       "drun";
      show-icons:                 true;
    	drun-display-format:        "{name}";
    }
    @theme "/dev/null"
    * {
    font:                        "Product Sans 12";
    }

    window {
    transparency:                "real";
    location:   north west;
    anchor:   north west;
    fullscreen:                  false;
    width:                       360px;
    x-offset:                    20px;
    y-offset:                    20px;

    enabled:                     true;
    border-radius:               15px;
    cursor:                      "default";
    background-color:            #363a4f;
    }

    mainbox {
    enabled:                     true;
    spacing:                     0px;
    background-color:            transparent;
    orientation:                 horizontal;
    children:                    [ "listbox" ];
    }

    listbox {
    spacing:                     20px;
    padding:                     20px;
    background-color:            transparent;
    orientation:                 vertical;
    children:                    [ "inputbar", "message", "listview" ];
    }

    dummy {
    background-color:            transparent;
    }

    inputbar {
    enabled:                     true;
    spacing:                     10px;
    padding:                     15px;
    border-radius:               10px;
    background-color:            #5b6078;
    text-color:                  #cad3f5;
    children:                    [ "textbox-prompt-colon", "entry" ];
    }
    textbox-prompt-colon {
    enabled:                     true;
    expand:                      false;
    str:                         "  ";
    font:                        "Iosevka Nerd Font 12";
    background-color:            inherit;
    text-color:                  inherit;
    }
    entry {
    enabled:                     true;
    background-color:            inherit;
    text-color:                  inherit;
    cursor:                      text;
    placeholder:                 "Search";
    placeholder-color:           inherit;
    }

    mode-switcher{
    enabled:                     true;
    spacing:                     20px;
    background-color:            transparent;
    text-color:                  #cad3f5;
    }
    button {
    padding:                     15px;
    border-radius:               10px;
    background-color:            #5b6078;
    text-color:                  inherit;
    cursor:                      pointer;
    }
    button selected {
    background-color:            #5b6078;
    text-color:                  #c6a0f6;
    }

    listview {
    enabled:                     true;
    columns:                     1;
    lines:                       5;
    cycle:                       true;
    dynamic:                     true;
    scrollbar:                   false;
    layout:                      vertical;
    reverse:                     false;
    fixed-height:                true;
    fixed-columns:               true;

    spacing:                     10px;
    background-color:            transparent;
    text-color:                  #cad3f5;
    cursor:                      "default";
    }

    element {
    enabled:                     true;
    spacing:                     15px;
    padding:                     8px;
    border-radius:               10px;
    background-color:            transparent;
    text-color:                  #cad3f5;
    cursor:                      pointer;
    }
    element normal.normal {
    background-color:            inherit;
    text-color:                  inherit;
    }
    element normal.urgent {
    background-color:            #ed8796;
    text-color:                  #cad3f5;
    }
    element normal.active {
    background-color:            #8aadf4;
    text-color:                  #cad3f5;
    }
    element selected.normal {
    background-color:            #5b6078;
    text-color:                  #c6a0f6;
    }
    element selected.urgent {
    background-color:            #ed8796;
    text-color:                  #cad3f5;
    }
    element selected.active {
    background-color:            #ed8796;
    text-color:                  #cad3f5;
    }
    element-icon {
    background-color:            transparent;
    text-color:                  inherit;
    size:                        32px;
    cursor:                      inherit;
    }
    element-text {
    background-color:            transparent;
    text-color:                  inherit;
    cursor:                      inherit;
    vertical-align:              0.5;
    horizontal-align:            0.0;
    }

    message {
    background-color:            transparent;
    }
    textbox {
    padding:                     15px;
    border-radius:               10px;
    background-color:            #5b6078;
    text-color:                  #cad3f5;
    vertical-align:              0.5;
    horizontal-align:            0.0;
    }
    error-message {
    padding:                     15px;
    border-radius:               20px;
    background-color:            #363a4f;
    text-color:                  #cad3f5;
    }
  '';
}
