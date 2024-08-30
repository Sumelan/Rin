{pkgs, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };
  environment.systemPackages = with pkgs; [
    # Desktop stuff
      dunst
      eww
      hypridle
      hyprlock
      hyprpicker
      rofi-wayland
      swww
      wofi
    # audio
      pamixer
      pavucontrol
      wireplumber
    # spotify stuff
      spicetify-cli
      spotify
    # disocrd
      vesktop
    # browzer
      brave
    # image-viewer
      imv
      pqiv
    # image-mannipulator
      gimp
      krita
    # video-viewer
      vlc
    # video-editor
      kdenlive
    # video-capture
      obs-studio
    # text-editor
      neovide
      vim
    # media
      mpv
    # terminal
      kitty
    # game
      lutris
      steam
    # developping
      meson
      ninja
      pkg-config
      (python312.withPackages (ps: with ps; [
        psutil
        configargparse
        sh
      ]))
      yad
    # tools
      file-roller
      networkmanagerapplet
    ## cli-programs
      bat
      brightnessctl
      cava
      cmatrix
      cowsay
      curl
      duf
      eza
      fastfetch
      fd
      ffmpeg
      ffmpegthumbnailer
      file
      fzf
      gh
      git
      grim
      grimblast
      htop
      inxi
      jq
      killall
      lazygit
      lolcat
      lshw
      lm_sensors
      ncdu
      nh
      pciutils
      playerctl
      ripgrep
      slurp
      socat
      tree
      unar
      unrar
      unzip
      wget
      wl-clipboard
      xdragon
      yazi
      ydotool
      yt-dlp
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
      qemu
      virt-viewer
      wine
      winetricks
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
        thunar-volman
        thunar-media-tags-plugin
      ];
    };
    file-roller.enable = true;
    kdeconnect.enable = true;
  };
}
