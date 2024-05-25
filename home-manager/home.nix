{

  imports = [
    ./zsh.nix
    ./modules/bundle.nix
  ];

  home = {
    username = "bathys";
    homeDirectory = "/home/bathys";
    stateVersion = "23.11";
  };
}
