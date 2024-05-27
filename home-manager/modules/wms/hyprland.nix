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

      monitor = ,preferred,auto,1

      env = XDG_CURRENT_DESKTOP,Hyprland
      env = XDG_SESSION_TYPE,wayland
      env = XDG_SESSION_DESKTOP,Hyprland
      env = XCURSOR_SIZE,24
      env = QT_QPA_PLATFORM,wayland
      env = XDG_SCREENSHOTS_DIR,~/Pictures/Screenshots

      exec-once = dbus-update-activation-environment --systemd --all
      exec-once = systemctl --user import-environment QT_QPA_PLATFORMTHEME WAYLAND_DISPLAY XDG_CURRENT_DESKTOP
      exec-once = swww-daemon & swww img ~/Pictures/wallpapers/nixos-chan.png
      exec-once = waybar
      exec-once = nm-applet
      exec-once = wl-paste --type text --watch cliphist store & wl-paste --type image --watch cliphist store & wl-paste --watch cliphist store
      exec-once = fcitx5
      exec-once = firefox
      exec-once = thunderbird
      exec-once = spotify

      #opacity window rules
      windowrule = opacity 1 0.84, vesktop
      windowrule = opacity 0.8, Spotify
      windowrule = opacity 0.9, neovide
      windowrule = opacity 0.8, bottles
      windowrule = opacity 0.8, fl64.exe
      windowrulev2 = opacity 0.8, title:(FL Studio)

      #workspaces window rules
      windowrule = workspace 2, thunderbird
      windowrule = workspace 1, firefox
      windowrule = workspace special:magic, Spotify
      
    # rofi App launcher
     #bindr = $mainMod, $mainMod_L, exec, pkill rofi || rofi -show drun -modi drun,filebrowser,run,window # Super Key to Launch rofi menu
      bind = $mainMod, D, exec, pkill rofi || rofi -show drun -modi drun,filebrowser,run,window      

    # BASIC
      bind = CTRL ALT, Delete, exec, hyprctl dispatch exit 0
      bind = $mainMod, Q, killactive,
      bind = $mainMod, F, fullscreen
      bind = $mainMod SHIFT, Q, closewindow, 
      bind = $mainMod SHIFT, F, togglefloating,
      bind = $mainMod ALT, F, exec, hyprctl dispatch workspaceopt allfloat
      bind = CTRL ALT, L, exec, $scriptsDir/LockScreen.sh
      bind = CTRL ALT, P, exec, $scriptsDir/Wlogout.sh

    # FEATURES / EXTRAS
      bind = $mainMod, H, exec, $scriptsDir/KeyHints.sh # Small help file
      bind = $mainMod ALT, R, exec, $scriptsDir/Refresh.sh # Refresh waybar, swaync, rofi
      bind = $mainMod ALT, E, exec, $scriptsDir/RofiEmoji.sh # emoji
      bind = $mainMod, S, exec, $scriptsDir/RofiSearch.sh # Google search from Rofi
      bind = $mainMod SHIFT, B, exec, $scriptsDir/ChangeBlur.sh # Toggle blur settings 
      bind = $mainMod SHIFT, G, exec, $scriptsDir/GameMode.sh # animations ON/OFF
      bind = $mainMod ALT, L, exec, $scriptsDir/ChangeLayout.sh # Toggle Master or Dwindle Layout
      bind = $mainMod ALT, V, exec, $scriptsDir/ClipManager.sh # Clipboard Manager
      bind = $mainMod SHIFT, N, exec, swaync-client -t -sw # swayNC panel

    # FEATURES / EXTRAS (UserScripts)
      bind = $mainMod, E, exec, $UserScripts/QuickEdit.sh # Quick Edit Hyprland Settings
      bind = $mainMod SHIFT, M, exec, $UserScripts/RofiBeats.sh # online music
      bind = $mainMod, W, exec, $UserScripts/WallpaperSelect.sh # Select wallpaper to apply
      bind = CTRL ALT, W, exec, $UserScripts/WallpaperRandom.sh # Random wallpapers

    # Waybar / Bar related
      bind = $mainMod, B, exec, killall -SIGUSR1 waybar # Toggle hide/show waybar 
      bind = $mainMod CTRL, B, exec, $scriptsDir/WaybarStyles.sh # Waybar Styles Menu
      bind = $mainMod ALT, B, exec, $scriptsDir/WaybarLayout.sh # Waybar Layout Menu

    # Master Layout
      bind = $mainMod CTRL, D, layoutmsg, removemaster
      bind = $mainMod, I, layoutmsg, addmaster
      bind = $mainMod, J, layoutmsg, cyclenext
      bind = $mainMod, K, layoutmsg, cycleprev
      bind = $mainMod, M, exec, hyprctl dispatch splitratio 0.3
      bind = $mainMod, P, pseudo, # dwindle
      bind = $mainMod CTRL, Return, layoutmsg, swapwithmaster

    # group
      bind = $mainMod, G, togglegroup
      bind = ALT, tab, changegroupactive  #change focus to another window  

    # Special Keys / Hot Keys
      bind = , xf86audioraisevolume, exec, $scriptsDir/Volume.sh --inc #volume up
      bind = , xf86audiolowervolume, exec, $scriptsDir/Volume.sh --dec #volume down
      bind = , xf86AudioMicMute, exec, $scriptsDir/Volume.sh --toggle-mic #mute mic
      bind = , xf86audiomute, exec, $scriptsDir/Volume.sh --toggle
      bind = , xf86Sleep, exec, systemctl suspend  # sleep button 
      bind = , xf86Rfkill, exec, $scriptsDir/AirplaneMode.sh #Airplane mode

    # media controls using keyboards
      bind = , xf86AudioPlayPause, exec, $scriptsDir/MediaCtrl.sh --pause
      bind = , xf86AudioPause, exec, $scriptsDir/MediaCtrl.sh --pause
      bind = , xf86AudioPlay, exec, $scriptsDir/MediaCtrl.sh --pause
      bind = , xf86AudioNext, exec, $scriptsDir/MediaCtrl.sh --nxt
      bind = , xf86AudioPrev, exec, $scriptsDir/MediaCtrl.sh --prv
      bind = , xf86audiostop, exec, $scriptsDir/MediaCtrl.sh --stop

    # Screenshot keybindings NOTE: You may need to press Fn key as well
      bind = $mainMod, Print, exec, $scriptsDir/ScreenShot.sh --now
      bind = $mainMod SHIFT, Print, exec, $scriptsDir/ScreenShot.sh --area
      bind = $mainMod CTRL, Print, exec, $scriptsDir/ScreenShot.sh --in5 #screenshot in 5 secs
      bind = $mainMod CTRL SHIFT, Print, exec, $scriptsDir/ScreenShot.sh --in10 #screenshot in 10 secs
      bind = ALT, Print, exec, $scriptsDir/ScreenShot.sh --active #take screenshot of active window

    # screenshot with swappy (another screenshot tool)
      bind = $mainMod SHIFT, S, exec, $scriptsDir/ScreenShot.sh --swappy

    # Resize windows
      binde = $mainMod SHIFT, left, resizeactive,-50 0
      binde = $mainMod SHIFT, right, resizeactive,50 0
      binde = $mainMod SHIFT, up, resizeactive,0 -50
      binde = $mainMod SHIFT, down, resizeactive,0 50

    # Move windows
      bind = $mainMod CTRL, left, movewindow, l
      bind = $mainMod CTRL, right, movewindow, r
      bind = $mainMod CTRL, up, movewindow, u
      bind = $mainMod CTRL, down, movewindow, d

  # Move focus with mainMod + arrow keys
      bind = $mainMod, left, movefocus, l
      bind = $mainMod, right, movefocus, r
      bind = $mainMod, up, movefocus, u
      bind = $mainMod, down, movefocus, d

  # Workspaces related
      bind = $mainMod, tab, workspace, m+1
      bind = $mainMod SHIFT, tab, workspace, m-1

  # Special workspace
      bind = $mainMod SHIFT, U, movetoworkspace, special
      bind = $mainMod, U, togglespecialworkspace,

      plugin  {

      }

      debug {
        disable_logs = false
        enable_stdout_logs = true
      }

      input {
        kb_layout = us

        follow_mouse = 1
        sensitivity = 0
        accel_profile = false

        touchpad {
          natural_scroll = true
          middle_button_emulation = true
          clickfinger_behavior = true
        }
      }

      gestures {
        workspace_swipe = true
        workspace_swipe_fingers = 3
      }

      general {
        gaps_in = 4
        gaps_out = 4
        border_size = 2
        col.active_border = rgba(${theme.base0A}ff)
        col.inactive_border = rgb();

        layout = dwindle
        allow_tearing = true
      }

      decoration {
        rounding = 0
        blur {
          enabled = true
          size = 2
          passes = 3
          xray = true
          new_optimizations = true
        }
        drop_shadow = false
        shadow_range = 4
        shadow_render_power = 3
        col.shadow = rgba(${theme.base02}ff)
      }

      animations {
        enabled = true
        bezier = myBezier, 0.05, 0.9, 0.1, 1.05
        animation = windows, 1, 7, myBezier
        animation = windowsOut, 1, 7, default, popin 80%
        animation = border, 1, 10, default
        animation = borderangle, 1, 8, default
        animation = fade, 1, 7, default
        animation = workspaces, 1, 6, default
      }

      dwindle {
        pseudotile = true
        preserve_split = true
      }

      master {
        new_is_master = true
      }

      misc {
        force_default_wallpaper = -1
      }
 '';
 };
}
