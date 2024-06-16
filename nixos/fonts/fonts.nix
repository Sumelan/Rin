{ pkgs, ... }:
{
  imports = [
      ./material-symbols.nix
      ./phospor.nix
  ];

  fonts = {
    packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    source-code-pro
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
         serif = [ "Noto Serif CJK JP" "Noto Color Emoji" ];
         sansSerif = [ "Noto Sans CJK JP" "Noto Color Emoji" ];
         monospace = [ "ComicShannsMono Nerd Font" "Noto Color Emoji" ];
         emoji = [ "Noto Color Emoji" ];
      };
    };
  };
}
