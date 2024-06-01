{
  programs.waybar = {
    enable = true;
    systemd = {
      enable = true; # disable it,autostart it in hyprland conf
      target = "graphical-session.target";
    };
    style = ''
	    window#waybar {
    		font-family: "JetBrains Mono NerdFont";
    		background-color: rgba(0,0,0,0);
    		font-size: 1.2rem;
    		border-radius: 0.5rem;
	    }

	    tooltip {
    		font-family: "JetBrains Mono NerdFont";
    		font-size: 0.8rem;
	    }

      .modules-left {
      	background: linear-gradient(315deg, rgba(145, 0, 135, 0.4), rgba(79, 0, 116, 0.6));
 	      border-radius: 0.5rem;
    	  padding: 3px;
      }
      .modules-center {
    	  background: linear-gradient(180deg, rgba(145, 0, 135, 0.4), rgba(79, 0, 116, 0.6));
    	  border-radius: 0.5rem;
    	  padding: 3px;
      }
      .modules-right {
    	  background: linear-gradient(45deg, rgba(145, 0, 135, 0.4), rgba(79, 0, 116, 0.6));
    	  border-radius: 0.5rem;
    	  padding: 3px;
      }

      #image.powermenu {
    	  background-color: rgba(0,0,0,0.3);
    	  border-radius: 0.5rem;
    	  padding: 0px 10px;
    	  border-left: 10px;
      }

      #workspaces {
    	  background-color: rgba(0,0,0,0.7);
    	  border-radius: 0.5rem;
    	  margin-left: 3px;
    	  margin-right: 3px;
    	  padding: 0 5px;
      }

      #workspaces button {
    	  font-size: 1.2rem;
    	  padding: 0 0.3rem 0 0;
      }

      #workspaces button.special {
    	  font-size: 1.2rem;
    	  padding: 0 0.3rem 0 0;
      }

      #workspaces button.active {
	      color: #a752df;
      }

      #workspaces button.urgent {
    	  color: #ff0000;
      }

      #window, #waybar-media {
	      background-color: rgba(0,0,0,0.3);
	      border-radius: 0.5rem;
	      padding: 2px 5px;
      }

      #custom-lightdarkmode {
    	  padding-right: 7px;
      }

      #custom-media {
    	  background-color: rgba(0,0,0,0.3);
    	  border-radius: 0.5rem;
    	  padding: 2px 5px;
      }

      #tray{
    	  background-color: rgba(0, 0, 0, 0.118);
    	  border-radius: 1rem;
    	  padding: 2px 5px;
      }

      #clock.time, #clock.date{
    	  font-weight:600
      }

      #wireplumber, #custom-lights, #network, #custom-lightdarkmode{
    	  margin-left: 6px;
    	  margin-right: 6px;
      }

      #wireplumber{
    	  font-size: 1.6rem;
      }

      #custom-seperator{
    	  font-size: 3rem;
      }

      #custom-space{
    	  font-size: 1rem;
      }

      #network {
    	  padding-right: 8px;
      }

      #battery {
    	  color: #90ee90;
      }

      #memory {
    	  color: #ffb6c1;
      }

      #disk {
    	  color: #87cefa;
      }

      #cpu {
    	  color: #fafad2;
      }

      #temperature {
    	  color: #778899;
      }
    '';

  settings = [
      {
	      "name" = "bar0";
	      "layer" = "top";
	      "position" = "top";
	      "height" = 40;
	      "margin-top" = 10;
	      "margin-left" = 18;
	      "margin-right" = 18;
	      "margin-bottom" = 0;
	      "spacing" = 3;
	      "reload_style_on_change" = true;

        modules-left = [
	        "image#powermenu"  
          "hyprland/workspaces" 
          "network" 
          "wireplumber"
          "custom/lightdarkmode"
        ];
        modules-center = [ 
          "hyprland/window"
        ];
        modules-right = [ 
          "custom/media" 
          "custom/space"
          "custom/seperator"
          "custom/space"
          "clock#date"
          "custom/space"
	        "clock#time"
          "custom/space"
        ];
       
        "custom/lightdarkmode" = {
          "exec" = "python /home/bathys/.config/waybar/scripts/darklightmode/getmode.py";
          "interval" = 1;
          "on-click" = "sleep 0.1 && python /home/bathys/.config/waybar/scripts/darklightmode/togglemode.py";
          "tooltip" = false;
          "tooltip-format" = "Toggle Mode";
 	      };

	      "custom/seperator" = {
          "tooltip" = true;
    	    "format" = "🪷";
    	    "tooltip-format" = "pretty :))";
  	    };

	      "image#powermenu" = {
    		  "tooltip" = true;
    		  "tooltip-format" = "Power Menu";
    		  "path" = "/home/bathys/.config/waybar/power.png";
    		  "size" = 16;
    		  "on-click" = "wlogout";
  	    };

	      "custom/lights" = {
    		  "tooltip" = true;
		      "tooltip-format" = "Light Control";
	    	  "format" = "󰌵";
    		  "on-click" = "";
      	};

 	      "custom/space" = {
    		  "tooltip" = false;
    		  "format" = " ";
  	    };

	      "tray" = {
    		  "icon-size" = 18;
    		  "spacing" = 10;
  	    };

	      "clock#date" = {
    		  "tooltip" = true;
    		  "format" = "{:%a, %b %d}";
    		  "tooltip-format" = "{:%A, %B %d, %Y}";
      	};

  	    "clock#time" = {
    		  "interval" = 1;
    		  "format" = "{:%I:%M%p}";
    		  "tooltip-format" = "<small>{calendar}</small>";
    		  "calendar" = {
      	    "mode" = "year";
      	    "mode-mon-col" = 3;
      			"weeks-pos" = "right";
      			"on-scroll" = 1;
      			"format" = {
        			"months" = "<span color='#ffead3'><b>{}</b></span>";
        			"days" = "<span color='#ecc6d9'><b>{}</b></span>";
        			"weeks" = "<span color='#99ffdd'><b>w{}</b></span>";
        			"weekdays" = "<span color='#ffcc66'><b>{}</b></span>";
        			"today" = "<span color='#ff6699'><b><u>{}</u></b></span>";
      		  };
    		  };
	 	      "actions" = {
		        "on-click-right" = "mode";
			      "on-click-middle" = "shift_reset";
			      "on-scroll-up" = "shift_up";
			      "on-scroll-down" = "shift_down";
		      };
  	    };

	        "idle_inhibitor" = {
		        "format" = "{icon}";
		        "format-icons" = {
			        "activated" = "󰛊 ";
			        "deactivated" = "󰾫 ";
    		    };
  	      };

	        "backlight" = {
    		    "interval" = 2;
    		    "format" = "󰖨 {percent}%";
		        "on-scroll-up" = "brightnessctl set +1%";
		        "on-scroll-down" = "brightnessctl set 1%-";
          };

	        "wireplumber" = {
		        "format" = "{icon}";
		        "tooltip-format" = "{volume}%";
		        "format-muted" = " ";
		        "on-click" = "pactl set-sink-mute $(pactl get-default-sink) toggle";
		        "format-icons" = ["" "" "" " " " "];
	        };

	        "network" = {
    		    "interface" = "eno1";
    		    "interval" = 2;
    		    "format-icons" = ["󰤯" "󰤟" "󰤢" "󰤥" "󰤨"];
    		    "format" = "Error";
    		    "tooltip-format" = "Error";
    		    "format-wifi" = "{icon}";
    		    "tooltip-format-wifi" = "{ipaddr}/{cidr}\n{essid} ({signalStrength}%) {icon}\n\n{ifname}\n{frequency}GHz {signaldBm}dBm  \n\n {bandwidthUpBits} |  {bandwidthDownBits} |  {bandwidthTotalBits}";
    		    "format-ethernet" = " ";
    		    "tooltip-format-ethernet" = "{ipaddr}/{cidr}\n{essid}\n\n{ifname}\n\n{bandwidthUpBits} {bandwidthDownBits} {bandwidthTotalBits}";
    		    "format-disconnected" = " ";
    		    "tooltip-format-disconnected" = "  Disconnected";
          };

	        "battery" = {
    		    "interval" = 10;
    		    "format" = "{icon}{capacity}%";
    		    "format-icons" = ["󰂎" "󰁺" "󰁻" "󰁼" "󰁽" "󰁾" "󰁿" "󰂀" "󰂁" "󰂂" "󰁹"];
    		    "tooltip" = true;
    		    "tooltip-format" = "{timeTo} ({capacity}%)\n\nCycles : {cycles}\nPower  : {power}W\nHealth : {health}%";
          };

	        "disk"= {
    		    "interval" = 15;
    		    "format" = "󰋊 {percentage_used}%";
    		    "tooltip-format" = "Used  : {used}\nTotal : {total} ({percentage_used}%)\nDisk  : {path}";
          };

	        "memory" = {
    		    "interval" = 10;
    		    "format" = " {used}";
    		    "tooltip-format" = "Used  : {used}GiB\nTotal : {total}GiB ({percentage}%)";
          };

          "cpu" = {
    		    "interval" = 10;
    		    "format" = " {usage}%";
          };

          "temperature" = {
    		    "interval" = 10;
          };

	        "custom/media" = {
	          "format" = "{icon} {} ";
    		    "escape" = true;
    		    "return-type" = "json";
    		    "max-length" = 40;
    		    "on-click" = "playerctl play-pause";
    		    "on-click-right" = "playerctl stop";
    		    "smooth-scrolling-threshold" = 0;
    		    "on-scroll-up" = "playerctl next";
    		    "on-scroll-down" = "playerctl previous";
    		    "exec" = "/home/bathys/.config/waybar/scripts/mediaplayer.py 2> /dev/null";
          };
  
  	      "hyprland/workspaces" = {
    		    "show-special" = true;
    		    "sort-by-name" = true;
    		    "sort-by-coordinates" = false;
    		    "persistent-workspaces" = {
      			  "1" = [];
      			  "2" = [];
      			  "3" = [];
      			  "4" = [];
      			  "5" = [];
      			  "6" = [];
    		    };
    		    "format" = " {icon} ";
    		    "format-icons" = {
      			  "1" = "";
      			  "2" = "";
      			  "3" = "";
      			  "4" = "";
      			  "5" = "";
      			  "6" = "";
      			  "default" = "";
    		    };
  	      };

  	      "hyprland/window" = {
    		    "icon" = true;
    		    "max-length" = 80;
    		    "icon-size" = 20;
    		    "rewrite" = {
      			  "" = "🪷hyprland🪷";
            };
         };
      } 
    ];
  };
}
