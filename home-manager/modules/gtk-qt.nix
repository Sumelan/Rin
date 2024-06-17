{ pkgs, config, gtkThemeFromScheme, ... }:
{
  gtk =
    let
      extraConfig = {
        gtk-decoration-layout = "menu:";
      };
    in
    {
      enable = true;
      font = {
        name = "ShureTechMono Nerd Font";
        size = 12;
      };
      /*
        theme = {
          name = "Catppuccin-Macchiato-Compact-Rosewater-Light";
          package = pkgs.catppuccin-gtk.override {
            accents = [ "rosewater" ];
            tweaks = [
              "rimless"
              "normal"
            ];
            variant = "macchiato";
            size = "compact";
          };
        };
      */

      theme = {
        name = "phocus";
      };

      iconTheme = {
        name = "Papirus";
      };
      gtk3 = {
        inherit extraConfig;
      };
      gtk4 = {
        inherit extraConfig;
      };
    };
  qt = {
    enable = true;
    platformTheme.name = "gtk";
    style = {
      /*
        name = "Catppuccin-Macchiato-Compact-Rosewater-Dark";
        package = pkgs.catppuccin-gtk.override {
          accents = [ "rosewater" ];
          tweaks = [
            "rimless"
            "normal"
          ];
          variant = "macchiato";
          size = "compact";
        };
      */
      name = "adwaita-light";
      package = pkgs.adwaita-qt;
    };
  };
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-light";
    };
  };

  home.pointerCursor = {
    gtk.enable = true;
    x11.enable = true;
    name = "Catppuccin-Macchiato-Rosewater-Cursors";
    package = pkgs.catppuccin-cursors.macchiatoRosewater;
    size = 28;
  };
}
