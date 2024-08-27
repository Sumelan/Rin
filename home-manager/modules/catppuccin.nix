{ inputs, pkgs, catppuccin, ... }:
{
  # import the flake's module for your system
  imports = [ inputs.catppuccin.homeManagerModules.catppuccin ];

  catppuccin = {
    enable = true;
    accent = "green";
    flavor = "macchiato";
    pointerCursor = {
      enable = true;
      accent = "rosewater";
      flavor = "macchiato";
    };
  };
  # gtk theme
  gtk.catppuccin = {
    enable = true;
    accent = "flamingo";
    flavor = "macchiato";
    size = "standard";
    tweaks = [ "rimless" "normal" ];
    icon = {
      enable = true;
      accent = "sapphire";
      flavor = "macchiato";
    };
  };
  # fcitx5
  i18n.inputMethod.fcitx5.catppuccin = {
    enable = true;
    apply = true;
    flavor = "macchiato";
  };
  # bat
  programs.bat.catppuccin = {
    enable = true;
    flavor = "macchiato";
  };
  # cava
  programs.cava.catppuccin = {
    enable = true;
    flavor = "macchiato";
    transparent = true;
  };
  # fzf
  programs.fzf.catppuccin = {
    enable = true;
    flavor = "macchiato";
  };
  # imv
  programs.imv.catppuccin = {
    enable = true;
    flavor = "macchiato";
  };
  # kitty
  programs.kitty.catppuccin = {
    enable = true;
    flavor = "macchiato";
  };
  # lazygit
  programs.lazygit.catppuccin = {
    enable = true;
    accent = "maroon";
    flavor = "macchiato";
  };
  # mpv
  programs.mpv.catppuccin = {
    enable = true;
    accent = "teal";
    flavor = "macchiato";
  };
  # neovim
  programs.neovim.catppuccin ={
    enable = true;
    flavor = "macchiato";
  };
  # rofi
  programs.rofi.catppuccin = {
    enable = false;
    flavor = "macchiato";
  };
  # starship
  programs.starship.catppuccin = {
    enable = true;
    flavor = "macchiato";
  };
  # yazi
  programs.yazi.catppuccin = {
    enable = true;
    flavor = "macchiato";
  };
  # zsh
  programs.zsh.syntaxHighlighting.catppuccin = {
    enable = true;
    flavor = "macchiato";
  };
  # qt
  qt.style.catppuccin = {
    enable = true;
    accent = "mauve";
    apply = true;
    flavor = "macchiato";
  };
  # dunst
  services.dunst.catppuccin = {
    enable = true;
    flavor = "macchiato";
  };
  # Hyprland
  wayland.windowManager.hyprland.catppuccin = {
    enable = true;
    accent = "green";
    flavor = "macchiato";
  };
}
