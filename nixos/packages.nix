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
      anki-bin
      bottles
      cpufrequtils
      firefox
      gimp
      hypridle
      hyprlock
      hyprpicker
      krita
      lutris
      neovide
      obs-studio
      opentabletdriver
      prismlauncher
      protonup-qt
      soundconverter
      spicetify-cli
      spotify
      thunderbird
      vencord
      vesktop
      vlc
      udiskie
      wine
      winetricks
    # CLI programs
      atuin
      bat
      btop
      clinfo
      cowsay
      curl
      fastfetch
      fd
      ffmpeg
      ffmpegthumbnailer
      file
      fzf
      gh # github cli
      git
      jq
      libappindicator
      lazygit
      lsd
      lshw
      ncspot
      nh
      nitch
      playerctl
      poppler
      qmk
      ripgrep
      starship
      socat
      spotdl
      unar
      vim
      wget
      xdg-utils
      ydotool
      yt-dlp
      zoxide
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
