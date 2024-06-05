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
  # Desktop apps
      baobab
      cpufrequtils
      firefox
      gparted
      kitty
      (mpv.override {scripts = [mpvScripts.mpris];})  #with tray
      spotify
      thunderbird
      (discord.override { withVencord = true; })
      vlc

  # Coding stuff
      libsForQt5.qt5.qtwayland
      meson
      ninja
      nixfmt-rfc-style
      nodejs
      pkg-config
      python3
      v4l-utils

  # CLI utils
      brightnessctl
      fastfetch
      ffmpeg
      ffmpegthumbnailer
      file
      git
      glib #  for gsettings to work
      glxinfo
      htop
      libappindicator
      libnotify
      killall
      openssl   # required by Rainbow borders
      playerctl
      ranger
      tree
      unar
      unzip
      vim
      wget
      yt-dlp
      zram-generator

  # Hyprland stuff
      ags
      btop
      cava
      cliphist
      gnome.eog
      gnome.gnome-system-monitor
      gnome.file-roller
      grim
      gtk-engine-murrine  # for gtk themes
      hyprcursor  # requires unstable channel
      hypridle    # requires unstable channel
      hyprlock    # requires unstable channel
      jq
      networkmanagerapplet
      nwg-look    # requires unstable channel
      nvtopPackages.full
      pyprland
      qt6.qtwayland
      qt6Packages.qtstyleplugin-kvantum  #kvantum
      libsForQt5.qtstyleplugin-kvantum   #kvantum
      slurp
      swappy
      swaynotificationcenter
      swww
      qt5ct
      qt6ct
      rofi-wayland
      wl-clipboard
      wlogout
      yad

    #waybar  # if wanted experimental next line
    #(pkgs.waybar.overrideAttrs (oldAttrs: { mesonFlags = oldAttrs.mesonFlags ++ [ "-Dexperimental=true" ];}))

  # Sound
      pamixer
      pavucontrol
      pipewire
      wireplumber

  # Others
      home-manager
      qemu_kvm
      sugar.sddm-sugar-dark # Name: sugar-dark
      tokyo-night # Name: tokyo-night-sddm
      pkgs.libsForQt5.qt5.qtgraphicaleffects
  ];
}
