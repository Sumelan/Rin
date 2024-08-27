{
  programs.git = {
    enable = true;
    userName  = "bathys";
    userEmail = "bathys@proton.me";
    extraConfig = {
      init = { defaultBranch = "main"; };
      core = {
        excludesfile = "$NIXOS_CONFIG_DIR/scripts/gitignore";
      };
    };
  };
}
