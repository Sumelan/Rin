{ colors, inputs, pkgs, ... }:
let
  spicePkgs = inputs.spicetify-nix.packages.${pkgs.system}.default;
in

{
  imports = [ inputs.spicetify-nix.homeManagerModule ];
  programs.spicetify =
    let
      # use a different version of spicetify-themes than the one provided by
      # spicetify-nix
      officialThemesOLD = pkgs.fetchgit {
        url = "https://github.com/spicetify/spicetify-themes";
        rev = "9ba01f9861d1f52e049ad1ac01883f1609ffd45b";
        sha256 = "0q2izca6qpgi1v17v4f9msr0lk78dl5binx78z9vszwf79x3kd2s";
      };
      # pin a certain version of the localFiles custom app
      localFilesSrc = pkgs.fetchgit {
        url = "https://github.com/hroland/spicetify-show-local-files/";
        rev = "1bfd2fc80385b21ed6dd207b00a371065e53042e";
        sha256 = "01gy16b69glqcalz1wm8kr5wsh94i419qx4nfmsavm4rcvcr3qlx";
      };
    in
    {
      spotifyPackage = pkgs.spotify;
      enable = true;
      colorScheme = "custom";
      theme = {
        name = "Dribbblish";
        src = officialThemesOLD;
        requiredExtensions = [
          # define extensions that will be installed with this theme
          {
            # extension is "${src}/Dribbblish/dribbblish.js"
            filename = "dribbblish.js";
            src = "${officialThemesOLD}/Dribbblish";
          }
        ];
        appendName = true; # theme is located at "${src}/Dribbblish" not just "${src}"

        # changes to make to config-xpui.ini for this theme:
        patches = {
          "xpui.js_find_8008" = ",(\\w+=)32,";
          "xpui.js_repl_8008" = ",$\{1}56,";
        };
        injectCss = true;
        replaceColors = true;
        overwriteAssets = true;
        sidebarConfig = true;
      };

      customColorScheme = {
        text = "e4e5e7";
        subtext = "CBCCCE";
        sidebar-text = "CBCCCE";
        main = "17181C";
        sidebar = "1E1F24";
        player = "1E1F24";
        card = "$26272B";
        shadow = "333438";
        selected-row = "333438";
        button = "FA3867";
        button-active = "e4e5e7";
        button-disabled = "A771EF";
        tab-active = "FA3867";
        notification = "F57F3D";
        notification-error = "FA3867";
        misc = "8f9093";
      };
      enabledExtensions = with spicePkgs.extensions; [
        playlistIcons
        lastfm
        historyShortcut
        hidePodcasts
        fullAppDisplay
        shuffle
        popupLyrics
        keyboardShortcut
      ];
    };
}
