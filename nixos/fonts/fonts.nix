{ pkgs, ... }:
{
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
    (pkgs.callPackage ./azuki_fontB.nix { })
    (pkgs.callPackage ./azuki_font.nix { })
    ];
    fontDir.enable = true;
    fontconfig = {
      defaultFonts = {
         serif = [ "azukifontB"  ];
         sansSerif = ["Noto Sans CJK JP" "Noto Color Emoji"];
         monospace = ["ComicShannsMono Nerd Font" "Noto Color Emoji"];
         emoji = ["Noto Color Emoji"];
      };
    };
  };
}
