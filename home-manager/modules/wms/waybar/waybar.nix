{ config, lib, pkgs, ... }:
{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = false; # disable it,autostart it in hyprland conf
      target = "graphical-session.target";
    };
    style = ''
      * {
      font-family: "JetBrainsMono Nerd Font";
      font-size: 13pt;
      color: #dadada;
      }
      #waybar {
        background-color: transparent;
        border-radius: 5px;
      }
      #workspaces {
        border-radius: 5px;
        box-shadow: 0px 0px black;
      }

      #workspaces,
      #network,
      #backlight,
      #pulseaudio,
      #clock,
      #battery,
      #idle_inhibitor,
      #bluetooth,
      #custom-launcher,
      #custom-power,
      #custom-notification{
        margin-left:5px;
        margin-right: 5px;
        background: #141b1e;
        border-radius:5px 0px 0px 5px;
        padding-left:10px;
        padding-right: 10px;
      }
      #network,
      #pulseaudio,
      #backlight,
      #bluetooth{
        margin:0px;
      }
      #backlight,
      #bluetooth{
        border-radius:0px;
      }
      #pulseaudio{
        border-radius: 0px 5px 5px 0px;
      }

      #idle_inhibitor,
      #clock,
      #workspaces,
      #custom-launcher,
      #custom-power,
      #battery,
      #custom-notification{
        border-radius: 5px;
      }

      #idle_inhibitor.activated{
        color:#e57474;
      }

      #custom-launcher {
        font-size: 20px;
        padding-left: 8px;
        padding-right: 6px;
        color: #7ebae4;
      }

      #custom-power{
        color:#c47fd5;
        margin-right:10px;
        padding-right:14px;
      }

      #tray {
      padding-right: 8px;
      padding-left: 10px;
      }
      #tray menu {
      background: #3b4252;
      color: #DEE2EA;
      }
    '';

    settings = [
      {
        "layer" = "top";
        "position" = "top";
        modules-left = [
		        "custom/launcher"
            "hyprland/workspaces"
	      ];
        modules-center = [
		        "clock"
	      ];
        modules-right = [
            "custom/notification"
            "idle_inhibitor"
            "backlight"
            "bluetooth"
            "pulseaudio"
		        "network"
		        "battery"
		        "custom/power"
	      ];

        "custom/launcher" = {
          "format" = " ";
          "on-click" = "pkill rofi || rofi -show drun -modi drun,run,filebrowser,window";
          "tooltip" = false;
        };
        "hyprland/workspaces" = {
          "format" = "{name}";
          "on-scroll-up" = "hyprctl dispatch workspace e+1";
          "on-scroll-down" = "hyprctl dispatch workspace e-1";
          "on-click" = "activate";
        };
        "backlight" = {
          "device" = "intel_backlight";
          "on-scroll-up" = "brightnessctl s 5%+";
          "on-scroll-down" = "brightnessctl s 5%-";
          "format" = "{icon} {percent}%";
          "format-icons" = [
            "󰃝 "
            "󰃞 "
            "󰃟 "
            "󰃠 "
          ];
        };
        "idle_inhibitor" = {
          "format" = "{icon}";
          "format-icons" = {
            "activated" = " ";
            "deactivated" = " ";
          };
        };
        "pulseaudio" = {
          "format" = "<span foreground='#e5c76b'>{icon}</span> {volume}%";
          "format-muted" = "<span foreground='#e5c76b'>󰖁 </span> Muted";
          "format-icons" = {
            "default" = [ "" " " " " ];
            "alsa_output.usb-SXW_iFi_USB_Audio_SE_iFi_USB_Audio_SE-00.iec958-stereo" = " - ";
            "headphone" = " ";
            "phone" = " ";
            "portable" = " ";
            "car" = " ";
          };
          "on-click" = "pavucontrol";
          "on-click-right" = "amixer sset Master toggle 1>/dev/null";
        };
        "battery" = {
          "interval" = 2;
          "states" = {
            "good" = 95;
            "warning" = 20;
            "critical" = 10;
          };
          "format" = "<span color='#8ccf7e'>{icon}</span> {capacity}%";
          "format-icons" = [
            " "
            " "
            " "
            " "
            " "
          ];
          "format-plugged" = "<span color='#8ccf7e'></span> {capacity}%";
          "format-charging" = "<span color='#8ccf7e'></span> {capacity}%";
          "tooltip" = false;
        };
        "clock" = {
          "interval" = 1;
          "format" = "  {:%H:%M:%S}";
          "format-alt" = "  {:%H:%M |  %Y年 %m月 %d日}";
          "tooltip" = false;
        };
        "bluetooth" = {
    	    "format-on" = "<span color='#e57474'></span> Turned On";
    	    "format-off" = "<span color='#e57474'></span> Turned Off";
    	    "format-disabled" = "<span color='#e57474'></span> Disabled";
    	    "format-connected" = "<span color='#e57474'></span> Connected";
    	    "format" = "<span color='#e57474'></span> Disabled";
    	    "on-click" = "blueman-manager &";
        };
        "network" = {
          "format-disconnected" = "<span color='#67b0e8'>󰯡</span> Disconnected";
          "format-ethernet" = "<span color='#67b0e8'>󰀂</span> {ifname}";
          "format-linked" = "<span color='#67b0e8'>󰖪</span> {ifname} (No IP)";
          "format-wifi" = "<span color='#67b0e8'>󰖩</span> {essid}";
          "interval" = 60;
          "tooltip" = false;
        };
        "custom/power" = {
          "format" = "";
          "on-click" = "wlogout";
        };
        "custom/notification" = {
          "format" = "󱅫";
          "on-click" = "swaync-client -t -sw";
        };
        /*
        "tray" = {
          "icon-size" = 15;
          "spacing" = 5;
        };
        */
      }
    ];
  };
}
