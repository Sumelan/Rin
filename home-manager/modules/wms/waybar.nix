{ config, lib, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false; # disable it,autostart it in hyprland conf
      target = "graphical-session.target";
      settings = {
        "layer" = "top";
        "position" = "top";
        modules-left = [ "custom/launcher" "hyprland/workspaces" "custom/wall" ];
        modules-center = [ "clock" "hyprland/window" ];
        modules-right = [ "wireplumber" "backlight" "memory" "cpu" "network" "temperature" "battery" "custom/powermenu" "tray" ];
        "custom/launcher" = {
          "format" = "󰫢 ";
          #"on-click" = "pkill rofi || ~/.config/rofi/launcher.sh";
          "tooltip" = false;
        };
        "hyprland/window" = {
          max-length = 25;
          separate-outputs = false;
          rewrite = {
            "" = "BathyScarfOS";
          };
        };
        /*
          "custom/wall" = {
            "on-click" = ${sharedScripts.wallpaper_random}/bin/wallpaper_random";
            "on-click-middle" = "${sharedScripts.default_wall}/bin/default_wall";
            "on-click-right" = killall dynamic_wallpaper || ${sharedScripts.dynamic_wallpaper}/bin/dynamic_wallpaper &";
            "format" = " 󰠖 ";
            "tooltip" = false;
          };
        */
        "custom/cava-internal" = {
          "exec" = ""; # "sleep 1s && ${sharedScripts.cava-internal}/bin/cava-internal";
          "tooltip" = false;
        };
        "hyprland/workspaces" = {
          "format" = "{name}";
          "on-click" = "activate";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
        };
        "backlight" = {
          "device" = "intel_backlight";
          "on-scroll-up" = "light -A 5";
          "on-scroll-down" = "light -U 5";
          "format" = "{icon} {percent}%";
          "format-icons" = [
            "󰃝"
            "󰃞"
            "󰃟"
            "󰃠"
          ];
        };
        "wireplumber" = {
          "scroll-step" = 1;
          "format" = "{icon} {volume}%";
          "format-muted" = "󰖁 Muted";
          "format-icons" = {
            "default" = [
              ""
              ""
              ""
            ];
          };
          "on-click" = "pavucontrol";
          "tooltip" = true;
        };
        "battery" = {
          "interval" = 10;
          "states" = {
            "warning" = 20;
            "critical" = 10;
          };
          "format" = "{icon} {capacity}%";
          "format-icons" = [
            "󰁺"
            "󰁻"
            "󰁼"
            "󰁽"
            "󰁾"
            "󰁿"
            "󰂀"
            "󰂁"
            "󰂂"
            "󰁹"
          ];
          "format-full" = "{icon} {capacity}%";
          "format-charging" = "󰂄 {capacity}%";
          "tooltip" = false;
        };
        "clock" = {
          "interval" = 1;
          "format" = "{:%I:%M %p  %A %b %d}";
          "tooltip" = true;
          "tooltip-format"= "{=%A; %d %B %Y}\n<tt>{calendar}</tt>";
        # "tooltip-format" = "上午：高数\n下午：Ps\n晚上：Golang\n<tt>{calendar}</tt>";
        };
        "memory" = {
          "interval" = 1;
          "format" = "󰍛 {percentage}%";
          "states" = {
            "warning" = 85;
          };
        };
        "cpu" = {
          "interval" = 1;
          "format" = "󰻠 {usage}%";
        };
        /*
          "mpd" = {
            "max-length" = 25;
            "format" = "<span foreground='#bb9af7'></span> {title}";
            "format-paused" = " {title}";
            "format-stopped" = "<span foreground='#bb9af7'></span>";
            "format-disconnected" = "";
            "on-click" = "mpc --quiet toggle";
            "on-click-right" = "mpc update; mpc ls | mpc add";
            "on-click-middle" = "kitty --class='ncmpcpp' ncmpcpp";
            "on-scroll-up" = "mpc --quiet prev";
            "on-scroll-down" = "mpc --quiet next";
            "smooth-scrolling-threshold" = 5;
            "tooltip-format" = "{title} - {artist} ({elapsedTime:%M:%S}/{totalTime:%H:%M:%S})";
          };
        */
        "network" = {
          "format-disconnected" = "󰯡 Disconnected";
          "format-ethernet" = " Wired";
          "format-linked" = "󰖪 (No IP)";
          "format-wifi" = "󰖩 ";
          "interval" = 1;
          "tooltip" = true;
          "tooltip-format" = "󰖩  {essid} ({ipaddr})";
          "on-click" = "nm-applet --indicator";
        };
        "temperature" = {
          #"critical-threshold"= 80;
          "tooltip" = false;
          "format" = " {temperatureC}°C";
        };
        "custom/powermenu" = {
          "format" = "";
          "on-click" = "wlogout";
          "tooltip" = false;
        };
        "tray" = {
          "icon-size" = 15;
          "spacing" = 5;
        };
      }
    ];
  
    style = 
      ''
* {
    border: none;
    border-radius: 0;
    /* `otf-font-awesome` is required to be installed for icons */
    font-family: JetBrains Mono;
    font-weight: bold; 
    min-height: 20px;
}

window#waybar {
    background: transparent;
}

window#waybar.hidden {
    opacity: 0.2;
}

#workspaces {
    margin-right: 8px;
    border-radius: 10px;
    transition: none;
    background: #383c4a;
}

#workspaces button {
    transition: none;
    color: #7c818c;
    background: transparent;
    padding: 5px;
    font-size: 18px;
}

#workspaces button.persistent {
    color: #7c818c;
    font-size: 12px;
}

/* https://github.com/Alexays/Waybar/wiki/FAQ#the-workspace-buttons-have-a-strange-hover-effect */
#workspaces button:hover {
    transition: none;
    box-shadow: inherit;
    text-shadow: inherit;
    border-radius: inherit;
    color: #383c4a;
    background: #7c818c;
}

#workspaces button.active {
    background: #4e5263;
    color: white;
    border-radius: inherit;
}

#language {
    padding-left: 16px;
    padding-right: 8px;
    border-radius: 10px 0px 0px 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#keyboard-state {
    margin-right: 8px;
    padding-right: 16px;
    border-radius: 0px 10px 10px 0px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#custom-pacman {
    padding-left: 16px;
    padding-right: 8px;
    border-radius: 10px 0px 0px 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#custom-mail {
    margin-right: 8px;
    padding-right: 16px;
    border-radius: 0px 10px 10px 0px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#submap {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#clock {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px 0px 0px 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#custom-weather {
    padding-right: 16px;
    border-radius: 0px 10px 10px 0px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#pulseaudio {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#pulseaudio.muted {
    background-color: #90b1b1;
    color: #2a5c45;
}

#custom-mem {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#cpu {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#temperature {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#temperature.critical {
    background-color: #eb4d4b;
}

#backlight {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#battery {
    margin-right: 8px;
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

#battery.charging {
    color: #ffffff;
    background-color: #26A65B;
}

#battery.warning:not(.charging) {
    background-color: #ffbe61;
    color: black;
}

#battery.critical:not(.charging) {
    background-color: #f53c3c;
    color: #ffffff;
    animation-name: blink;
    animation-duration: 0.5s;
    animation-timing-function: linear;
    animation-iteration-count: infinite;
    animation-direction: alternate;
}

#tray {
    padding-left: 16px;
    padding-right: 16px;
    border-radius: 10px;
    transition: none;
    color: #ffffff;
    background: #383c4a;
}

@keyframes blink {
    to {
        background-color: #ffffff;
        color: #000000;
    }
}
      '';
  };
}
