{pkgs, config, inputs, lib, host, ... }:
  let
    theme = config.colorScheme.palette;
    hyprplugins = inputs.hyprland-plugins.packages.${pkgs.system};
  in
  {  
    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;
      systemd.enable = true;
      plugins = [
      #shgnjk
      ];
      extraConfig = ''

        $mainMod = SUPER
        $terminal = alacritty
        $fileManager = thunar
        $menu = rofi -show drun

      monitor = ",preferred,auto,1"

      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_SESSION_DESKTOP,Hyprland
      env = XCURSOR_SIZE,24
      env = QT_QPA_PLATFORM,wayland
      env = XDG_SCREENSHOTS_DIR,~/Pictures/Screenshots
      
      exec-once = swww init
      exec-once = swww img ~/Downloads/nixos-chan.png
      exec-once = waybar
      exec-once = wl-paste --type text --watch cliphist store
      exec-once = wl-paste --type image --watch cliphist store
      exec-once = fcitx5

      windowrule =  float, ^(imv)$
      windowrule =  float, ^(mpv)$  

      bindr = $mainMod, $mainMod_L, exec, pkill rofi || rofi -show drun -modi drun,filebrowser,run,window # Super Key to Launch rofi menu
      bind = $mainMod, D, exec, pkill rofi || rofi -show drun -modi drun,filebrowser,run,window

      bind = $mainMod, RETURN, exec, $terminal
      bind = $mainMod, SPACE, exec, $menu
      bind = $mainMod, T, exec, $fileManager
      bind = $mainMod, C, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy
      bind = $mainMod, S, exec, grim -g "$(slurp -d)" - |swappy -f -

      bind = $mainMod, Q, killactive
      bind = $mainMod, ESC, exit
      bind = $mainMod, V, togglefloating
      bind = $mainMod, F, fullscreen
      bind = $mainMod, P, pseudo, dwindle

      bind = $mainMod, H, movefocus, l
      bind = $mainMod, J, movefocus, d
      bind = $mainMod, K, movefocus, u
      bind = $mainMod, L, movefocus, r
      bind = $mainMod SHIFT, H, movewindow, l
      bind = $mainMod SHIFT, J, movewindow, d
      bind = $mainMod SHIFT, K, movewindow, u
      bind = $mainMod SHIFT, L, movewindow, r
      bind = ALT, Tab, cyclenext
      bind = ALT, Tab, bringactivetotop

      bind = $mainMod, 1, workspace, 1
      bind = $mainMod, 2, workspace, 2
      bind = $mainMod, 3, workspace, 3
      bind = $mainMod, 4, workspace, 4
      bind = $mainMod, 5, workspace, 5
      bind = $mainMod, 6, workspace, 6
      bind = $mainMod, 7, workspace, 7
      bind = $mainMod, 8, workspace, 8
      bind = $mainMod, 9, workspace, 9
      bind = $mainMod, 0, workspace, 10
      bind = $mainMod SHIFT, 1, movetoworkspace, 1
      bind = $mainMod SHIFT, 2, movetoworkspace, 2
      bind = $mainMod SHIFT, 3, movetoworkspace, 3
      bind = $mainMod SHIFT, 4, movetoworkspace, 4
      bind = $mainMod SHIFT, 5, movetoworkspace, 5
      bind = $mainMod SHIFT, 6, movetoworkspace, 6
      bind = $mainMod SHIFT, 7, movetoworkspace, 7
      bind = $mainMod SHIFT, 8, movetoworkspace, 8
      bind = $mainMod SHIFT, 9, movetoworkspace, 9
      bind = $mainMod SHIFT, 0, movetoworkspace, 10

      bind = $mainMod, X, togglespecialworkspace, magic
      bind = $mainMod, Z, togglespecialworkspace, scratch
      bind = $mainMod SHIFT, X, movetoworkspace, special:magic
      bind = $mainMod SHIFT, Z, movetoworkspace, special:scratch

      bind = $mainMod, mouse_down, workspace, e+1
      bind = $mainMod, mouse_up, workspace, e-1
      bindm = $mainMod, mouse:272, movewindow
      bindm = $mainMod, mouse:273, resizewindow

      plugin  {

      }
      input  {
        kb_layout = us

        follow_mouse = 1

        touchpad {
          natural_scroll = false
          middle_button_emulation = true
          clickfinger_behavior = true
        }

        sensitivity = 0; # -1.0 - 1.0, 0 means no modification.

        gestures {
          workspace_swipe = true
          workspace_swipe_fingers = 3
       }

        general {
          gaps_in = 4
          gaps_out = 4
          border_size = 2
          "col.active_border" = "rgba(33ccffee) rgba(00ff99ee) 45deg"
          "col.inactive_border" = "rgba(595959aa)"

        layout = "dwindle"
        no_cursor_warps = false
      }

        decoration {
          rounding = 0;
          blur {
            enabled = true
            size = 2
            passes = 3
          new_optimizations = true
          }
          drop_shadow = false
          shadow_range = 4
          shadow_render_power = 3
          "col.shadow" = "rgba(1a1a1aee)"
        }

        animation {
          enable = true
          bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        # bezier = myBezier, 0.33, 0.82, 0.9, -0.08
          animation = windows,     1, 7,  myBezier
          animation = windowsOut,  1, 7,  default, popin 80%
          animation = border,      1, 10, default
          animation = borderangle, 1, 8,  default
          animation = fade,        1, 7,  default
          animation = workspaces,  1, 6,  default
        }
      }

      dwindle {
        pseudotile = true # master switch for pseudotiling. Enabling is bound to mainMod + P in the keybinds section below
        preserve_split = true # you probably want this
      }

      master {
        new_is_master = true
      }

      misc {
        animate_manual_resizes = true
        animate_mouse_windowdragging = true
        enable_swallow = true
        render_ahead_of_time = false
        disable_hyprland_logo = true
      }
 '';
 };
}
