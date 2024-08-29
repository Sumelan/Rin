{pkgs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    # Desktop stuff
      dunst
      eww
      rofi-wayland
      swww
      hypridle
      hyprlock
      hyprpicker
    ## audio
      pamixer
      pavucontrol
      wireplumber
    ## spotify stuff
      spotify
      spicetify-cli
    ## disocrd
      vesktop
    ## browzer
      brave
    ## image-viewer
      imv
      pqiv
    ## image-mannipulator
      gimp
      krita
    ## video-viewer
      vlc
    ## video-editor
      kdenlive
    ## video-capture
      obs-studio
    ## text-editor
      vim
      neovide
    ## media
      mpv
    ## terminal
      kitty
    ## game
      lutris
      steam
    ## developping
      yad
      ninja
      meson
      pkg-config
    (python312.withPackages (ps: with ps; [
      psutil
      configargparse
      sh
    ]))
    ## tools
      networkmanagerapplet
      file-roller
    ## cli-programs
      cava
      brightnessctl
      htop
      tree
      grim
      cowsay
      cmatrix
      fastfetch
      socat
      slurp
      ffmpeg
      ffmpegthumbnailer
      wl-clipboard
      fd
      file
      fzf
      gh
      git
      lm_sensors
      lazygit
      lolcat
      bat
      killall
      eza
      ncdu
      duf
      curl
      wget
      lshw
      inxi
      playerctl
      nh
      ripgrep
      pciutils
      unar
      unrar
      unzip
      yt-dlp
      ydotool
      xdragon
      yazi
      zoxide
    ## login
      greetd.tuigreet
    # libs/frameworks
      libsForQt5.kdeconnect-kde
      libnotify
      libvirt
      lxqt.lxqt-policykit
      nixfmt-rfc-style
      v4l-utils
    # vm
      appimage-run
      bottles
      wine
      winetricks
      virt-viewer
      qemu
    ## other programs
      audiobookshelf
      tartube-yt-dlp
  ];

  # Options
  programs = {
    neovim.enable = true;
    hyprland = {
      enable = true;
      xwayland.enable = true;
    };
    dconf.enable = true;
    seahorse.enable = true;
    fuse.userAllowOther = true;
    mtr.enable = true;
    gnupg.agent = {
      enable = true;
      enableSSHSupport = true;
    };
    nm-applet.enable = true;
    steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
    };
    virt-manager.enable = true;
    thunar = {
      enable = true;
      plugins = with pkgs.xfce; [
        thunar-archive-plugin
        thunar-volman
        thunar-media-tags-plugin
      ];
    };
    file-roller.enable = true;
    kdeconnect.enable = true;
  };
}
