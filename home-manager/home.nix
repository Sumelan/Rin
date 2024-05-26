{

  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

# Nicely reload system units when changing configs
  systemd.user.startServices = "sd-switch";

  home = {
    username = "bathys";
    homeDirectory = "/home/bathys";
    stateVersion = "23.11";
  };

  programs.starship = {
    enable = true;
  };
}
