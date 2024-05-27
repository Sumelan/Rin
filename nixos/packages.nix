{pkgs, inputs, config, ... }:
{
  nixpkgs.config = {
    allowUnfree = true;
  };

  environment.systemPackages = (with pkgs; [
  # Desktop apps
    alacritty
    baobab
    cpufrequtils
    firefox
    gparted
    (mpv.override {scripts = [mpvScripts.mpris];})  #with tray
    spotifyd
    thunderbird
    (discord.override { withVencord = true; })
    vlc

  # Coding stuff
    python3

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
    openssl   # required by Rainbow borders
    ranger
    spotify-tui
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
    polkit_gnome
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

 ]) ++ [
       inputs.wallust.packages.${pkgs.system}.wallust 
      #inputs.ags.packages.${pkgs.system}.ags
 ];

  fonts = {
    packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    fira-code
    jetbrains-mono
    font-awesome
    terminus_font
    twemoji-color-font
    nerdfonts
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
         serif = ["Noto Serif CJK JP" "Noto Color Emoji"];
         sansSerif = ["Noto Sans CJK JP" "Noto Color Emoji"];
         monospace = ["JetBrainsMono Nerd Font" "Noto Color Emoji"];
         emoji = ["Noto Color Emoji"];
      };
    };
  };
}
