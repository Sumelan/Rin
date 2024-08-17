{ pkgs, lib, host, config, ... }:
{
  programs.waybar = {
    enable = true;
    package = pkgs.waybar;
    systemd = {
      enable = false; # disable it,autostart it in hyprland conf
      target = "graphical-session.target";
    };
    settings = [
      {
        layer = "top";
        position = "top";
        modules-left = [
          "custom/powermenu"
          "hyprland/workspaces"
          "tray"
        ];
        modules-center = [ 
          "clock"
          "idle_inhibitor"
          "custom/notification"
        ];
        modules-right = [
          "mpris"
          "pulseaudio"
          "backlight"
          "cpu"
          "memory"
          "network"
          "temperature"
          "battery"
        ];

        "custom/powermenu" = {
          format = " ";
          on-click = "pkill rofi || powermenu";
          tooltip = false;
        };
        "hyprland/workspaces" = {
          format = "{icon}";
          format-icons = {
            default = " ";
          };
          on-click = "activate";
          on-scroll-down = "hyprctl dispatch workspace e-1";
          on-scroll-up = "hyprctl dispatch workspace e+1";
        };
        "tray" = {
          icon-size = 15;
          spacing = 5;
        };
        "clock" = {
          format = "  {:%H:%M:%S}";
          format-alt = "  {:%H:%M |  %Y年 %m月 %d日}";
          interval = 1;
          tooltip = false;
        };
        "idle_inhibitor" = {
          format = "{icon}";
          format-icons = {
            activated = " ";
            deactivated = " ";
          };
          tooltip = true;
        };
        "custom/notification" = {
          escape = true;
          exec = "swaync-client -swb";
          exec-if = "which swaync-client";
          format = "{icon} {}";
          format-icons = {
            dnd-inhibited-none = " ";
            dnd-inhibited-notification = " <span foreground='red'><sup></sup></span>";
            dnd-none = " ";
            dnd-notification = " <span foreground='red'><sup></sup></span>";
            inhibited-none = " ";
            inhibited-notification = " <span foreground='red'><sup></sup></span>";
            none = " ";
            notification = " <span foreground='red'><sup></sup></span>";
          };
          on-click = "sleep 0.1 && swaync-client -t";
          return-type = "json";
          tooltip = false;
        };
        "mpris" = {
          format = "{player_icon} {dynamic}";
          format-paused = "{status_icon} <i>{dynamic}</i>";
          player-icons = {
            default = " ";
            mpv = " ";
          };
          status-icons = {
            paused = " ";
          };
          ignored-players = [
            "firefox"
            "brave"
          ];
        };
        "pulseaudio" = {
          format = "{icon} {volume}% {format_source}";
          format-bluetooth = "{volume}% {icon} {format_source}";
          format-bluetooth-muted = "󰂲 {icon} {format_source}";
          format-icons = {
            car = " ";
            default = [
              " "
              " "
              " "
            ];
            hands-free = " ";
            headphone = " ";
            headset = " ";
            phone = " ";
            portable = " ";
          };
          format-muted = "󰝟 {format_source}";
          format-source = " {volume}%";
          format-source-muted = " ";
          on-click = "sleep 0.1 && pavucontrol";
        };
        "backlight" = {
          device = "intel_backlight";
          format = "{icon} {percent}%";
          format-icons = [
            "󰃝 "
            "󰃞 "
            "󰃟 "
            "󰃠 "
          ];
          on-scroll-down =  "light -U 5";
          on-scroll-up = "light -A 5";
        };
        "cpu" = {
          format = " {usage}%";
          interval = 1;
        };
        "memory" = {
          format = " {percentage}%";
          interval = 1;
          states = {
            warning = 85;
          };
        };
        "network" = {
          format-disconnected = "󰤮 ";
          format-ethernet = " {bandwidthDownOctets}";
          format-icons = [
            "󰤯 "
            "󰤟 "
            "󰤢 "
            "󰤥 "
            "󰤨 "
          ];
          format-wifi = "{icon} {signalStrength}%";
          tooltip = false;
        };
        "temperature" = {
          format = " {temperatureC}°C";
          hwmon-path = "/sys/class/hwmon/hwmon1/temp1_input";
          tooltip = false;
        };
        "battery" = {
          format = "{icon} {capacity}%";
          format-charging = "󰂄 {capacity}%";
          format-icons = [
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
          format-plugged = "󱘖 {capacity}%";
          on-click = "";
          states = {
            critical = 15;
            warning = 30;
          };
          tooltip = false;
        };
      }
    ];
    style = ''
          * {
            font-family: "ShureTechMono Nerd Font";
            font-size: 12pt;
            font-weight: bold;
            border-radius: 0px;
            transition-property: background-color;
            transition-duration: 0.5s;
            }
            @keyframes blink_red {
              to {
                background-color: @rosewater;
                color: @red;
              }
            }
            .warning, .critical, .urgent {
              animation-name: blink_red;
              animation-duration: 1s;
              animation-timing-function: linear;
              animation-iteration-count: infinite;
              animation-direction: alternate;
            }
            window#waybar {
              background-color: transparent;
            }
            window > box {
              margin-left: 5px;
              margin-right: 5px;
              margin-top: 5px;
              border-radius: 10px;
              background-color: @base;
            }
            #workspaces {
              padding-left: 0px;
              padding-right: 4px;
            }
            #workspaces button {
              padding-top: 5px;
              padding-bottom: 5px;
              padding-left: 6px;
              padding-right: 6px;
              color: @overlay1;
            }
            #workspaces button.active {
              background-color: transparent;
              color: @sky;
            }
            #workspaces button.urgent {
              color: @pearch;
            }
            #workspaces button:hover {
              background-color: @base;
              color: @sky;
            }
            tooltip {
              background: @surface1;
            }
            tooltip label {
              color: @rosewater;
            }
            #custom-powermenu {
              font-size: 20px;
              padding-left: 8px;
              padding-right: 6px;
              color: @blue;
            }
            #clock, #mpris, #cpu, #memory, #temperature, #custom-notification, #backlight, #pulseaudio, #network, #battery {
              padding-left: 10px;
              padding-right: 10px;
            }
            #mpris {
              color: @blue;
            }
            #cpu {
              color: @teal;
            }
            #memory {
              color: @green;
            }
            #clock {
              color: @text;
            }
            #idle_inhibitor {
              color: @subtext1;
            }
            #temperature {
              color: @red;
            }
            #custom-notification {
              color: @yellow;
            }
            #backlight {
              color: @teal;
            }
            #pulseaudio {
              color: @lavender;
            }
            #network {
              color: @sky;
            }
            #network.disconnected {
              color: @subtext0;
            }
            #battery.charging, #battery.full, #battery.discharging {
              color: @green;
            }
            #battery.critical:not(.charging) {
              color: @red;
            }
            #tray {
              padding-right: 8px;
              padding-left: 10px;
            }
          '';
  };
}
