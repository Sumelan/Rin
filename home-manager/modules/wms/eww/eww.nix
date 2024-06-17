{
  programs.eww = {
    configDir = ./config;
    enable = true;
    # package = inputs.eww.packages.${pkgs.system}.eww;
  };
  # Place Files Inside Home Directory
  home.file.".config/eww/cache" = {
    source = ./images;
    recursive = true;
  };
}
