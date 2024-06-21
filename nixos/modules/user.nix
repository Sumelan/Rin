{ pkgs, ... }: 
{
  programs.zsh.enable = true;

  users = {
    users.bathys = {
      isNormalUser = true;
      description = "Bathys Scarf";
      extraGroups = [ "networkmanager" "wheel" "input" "libvirtd" ];
    };
    mutableUsers = true;
    defaultUserShell = pkgs.zsh;
  };

  # Enable automatic login for the user.
  services.getty.autologinUser = "bathys";
}
