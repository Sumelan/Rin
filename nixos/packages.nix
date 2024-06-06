{pkgs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages =
    let
      sugar = pkgs.callPackage ./sddm-sugar-dark.nix { };
      tokyo-night = pkgs.libsForQt5.callPackage ./sddm-tokyo-night.nix { };
    in
      with pkgs; [
    # de stuff
      brightnessctl
      cliphist
      dunst
      eww
      feh
      gparted
      gwenview
      grim
      kitty
      libnotify
      lm_sensors
      mpv
      networkmanagerapplet
      rofi-wayland
      polkit_gnome
      slurp
      swappy
      swww
      unrar
      unzip
      waybar
      wl-clipboard
      wlogout
      wpgtk
      yad
    # audio
      wireplumber
      pavucontrol
    # programs
      bottles
      cpufrequtils
      firefox
      gimp
      hyprpicker
      krita
      neovide
      obs-studio
      opentabletdriver
      soundconverter
      soulseekqt
      spicetify-cli
      spotify
      thunderbird
      vencord
      vesktop
      vlc

    # CLI programs
      fastfetch
      ffmpeg
      ffmpegthumbnailer
      file
      fzf
      gh # github cli
      git
      glib #  for gsettings to work
      glxinfo
      htop
      jq
      libappindicator
      lazygit
      playerctl
      ranger
      tree
      vim
      wget
      yt-dlp
      zram-generator

      hypridle    # requires unstable channel
      hyprlock    # requires unstable channel
    # libs/frameworks
      libsForQt5.kdeconnect-kde
      libsForQt5.qt5.qtwayland
      meson
      ninja
      nixfmt-rfc-style
      nodejs
      pkg-config
      python3
      qt6.qtwayland
      v4l-utils
    # vm
      qemu
    # sddm
      sugar.sddm-sugar-dark # Name: sugar-dark
      tokyo-night # Name: tokyo-night-sddm
  ];
}
