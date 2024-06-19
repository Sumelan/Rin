{ config, ... }:

let
  theme = config.colorScheme.palette;
in
{
  xdg.configFile.".config/eww/style/_colors.scss".text = ''
    $background : #${theme.base00};
    $foreground : #${theme.base05};
    $background-alt : #${theme.base01};
    $background-light : #${theme.base04};
    $foreground-alt : #${theme.base06};
    $red : #902c3b;
    $red-light : #${theme.base08};

    $green : #2a8664;
    $green-light : #${theme.base0B};


    $yellow : #eed49f;
    $yellow-light : #${theme.base0A};

    $blue : #8aadf4;
    $blue-light : #${theme.base0D};

    $cyan : #00ffff;
    $cyan-light : #${theme.base0C};

    $magenta : #ff00ff;
    $magenta-light : #${theme.base07};

    $comment : #${theme.base02};
    $accent : #${theme.base09};

  '';
}
