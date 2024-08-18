{ config, ... }:
{
  wayland.windowManager.hyprland =  {
    enable = true;
    xwayland.enable = true;
    systemd.enable = true;
    plugins = [
      #shgnjk
    ];
    extraConfig = ''

      #variables
      $mainMod = SUPER
      $terminal = kitty
      $fileManager = thunar
      $browser = brave

      #monitors
      monitor= , preferred, auto, 1

      #env variables
      env = NIXOS_OZONE_WL, 1
      env = NIXPKGS_ALLOW_UNFREE, 1
      env = XDG_CURRENT_DESKTOP, Hyprland
      env = XDG_SESSION_TYPE, wayland
      env = XDG_SESSION_DESKTOP, Hyprland
      env = GDK_BACKEND, wayland, x11
      env = CLUTTER_BACKEND, wayland
      env = QT_QPA_PLATFORM=wayland;xcb
      env = QT_WAYLAND_DISABLE_WINDOWDECORATION, 1
      env = QT_AUTO_SCREEN_SCALE_FACTOR, 1
      env = SDL_VIDEODRIVER, x11
      env = MOZ_ENABLE_WAYLAND, 1

      #start programs
      exec-once = dbus-update-activation-environment --systemd --all
      exec-once = systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = pkill swww;sleep .5 && swww init
      exec-once = sleep 1.5 && swww img ~/Pictures/wallpapers/pink/genshin-ayaka.png
      exec-once = pkill waybar;sleep .5 && waybar
      exec-once = pkill swaync;sleep .5 && swaync
      exec-once = nm-applet --indicator
      exec-once = blueman-applet
      exec-once = lxqt-policykit-agent
      exec-once = wl-paste --type text --watch cliphist store & wl-paste --type image --watch cliphist store & wl-paste --watch cliphist store
      exec-once = systemd
      exec-once = kdeconnect-indicator
      exec-once = fcitx5

      #window rules
      windowrulev2 = opacity 0.9 0.7, class:^(Brave)$
      windowrulev2 = opacity 0.9 0.7, class:^(thunar)$
      windowrulev2 = stayfocused, title:^()$,class:^(steam)$
      windowrulev2 = minsize 1 1, title:^()$,class:^(steam)$
      windowrule = noborder,^(wofi)$
      windowrule = center,^(wofi)$
      windowrule = center,^(steam)$
      windowrule = float, nm-connection-editor|blueman-manager
      windowrule = float, swayimg|vlc|Viewnior|pavucontrol
      windowrule = float, nwg-look|qt5ct|mpv
      windowrule = float, zoom

      #workspace monitor rules

      #keybindings
      bind = $mainMod, Return, exec, $terminal
      bind = $mainMod SHIFT, Return, exec, pkill rofi || rofi -show drun
      bind = $mainMod, T, exec, $fileManager
      bind = $mainMod, W, exec, $browser
      bind = $mainMod, C, exec, cliphist list | rofi -dmenu | cliphist decode | wl-copy
      bind = $mainMod, S, exec, screenshotmenu
      bind = $mainMod ALT, W, exec, wallsetter
      bind = $mainMod ALT, P, exec, powermenu

      bind = $mainMod, Q, killactive
      bind = $mainMod, ESC, exit
      bind = $mainMod, V, togglefloating
      bind = $mainMod, F, fullscreen
      bind = $mainMod, P, pseudo, dwindle

      bind = ,XF86AudioRaiseVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%+
      bind = ,XF86AudioLowerVolume, exec, wpctl set-volume @DEFAULT_AUDIO_SINK@ 5%-
      binde = ,XF86AudioMute, exec, wpctl set-mute @DEFAULT_AUDIO_SINK@ toggle
      bind = ,XF86AudioPlay, exec, playerctl play-pause
      bind = ,XF86AudioNext, exec, playerctl next
      bind = ,XF86AudioPrev, exec, playerctl previous
      bind = ,XF86MonBrightnessUp, exec, brightnessctl set 5%+
      bind = ,XF86MonBrightnessDown, exec, brightnessctl set 5%+
      bind = ,Print, exec, screenshotmenu
      #bind = ,XF86Search, exec,
      #bind = $mainMod, K, exec, 
      #bind = $mainMod, D, exec, 
      bind = $mainMod ALT, L, exec, hyprlock

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

      plugin {
        hyprtrails {
        }
      }

      input {
        kb_layout = us
        kb_options = caps:super
        follow_mouse = 1
        sensitivity = 0 # -1.0 - 1.0, 0 means no modification.
        accel_profile = false
        touchpad {
          natural_scroll = true
          disable_while_typing = true
          scroll_factor = 0.8
        }
      }

      gestures {
        workspace_swipe = true
        workspace_swipe_fingers = 3
      }

      general {
        gaps_in = 6
        gaps_out = 8
        border_size = 2
        layout = dwindle
        resize_on_border = true
        col.active_border = $accent $accentAlpha 45deg
        col.inactive_border = $mantle
      }

      decoration {
        rounding = 10
        drop_shadow = true
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(1a1a1aee)
        blur {
            enabled = true
            size = 5
            passes = 3
            new_optimizations = on
            ignore_opacity = off
        }
      }

      animations {
        enabled = yes
        bezier = wind, 0.05, 0.9, 0.1, 1.05
        bezier = winIn, 0.1, 1.1, 0.1, 1.1
        bezier = winOut, 0.3, -0.3, 0, 1
        bezier = liner, 1, 1, 1, 1
        animation = windows, 1, 6, wind, slide
        animation = windowsIn, 1, 6, winIn, slide
        animation = windowsOut, 1, 5, winOut, slide
        animation = windowsMove, 1, 5, wind, slide
        animation = border, 1, 1, liner
        animation = fade, 1, 10, default
        animation = workspaces, 1, 5, wind
      }

      dwindle {
        pseudotile = true
        preserve_split = true
      }

      master {
        new_status = inherit
      }

      misc {
        initial_workspace_tracking = 0
        mouse_move_enables_dpms = true
        key_press_enables_dpms = false
      }
    '';
  };
}
