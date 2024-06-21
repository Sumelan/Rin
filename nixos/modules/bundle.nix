{
  imports = [
    ./bluetooth.nix
    ./bootloader.nix
    ./env.nix
    ./hardware.nix
    ./network.nix
    ./security.nix
    ./services.nix
    ./stylix.nix
    ./sound.nix
    ./starship.nix
    ./systemd.nix
    ./trim.nix
    ./user.nix
    ./virtmanager.nix
    ./xdg-portal.nix
    ./zram.nix
    # Rin only 
    ./audiobookshelf.nix
    ./nextcloud.nix
  ];
}
