{
  imports = [
    ./bluetooth.nix
    ./bootloader.nix
    ./hardware.nix
    ./network.nix
    ./security.nix
    ./services.nix
    ./sound.nix
    ./starship.nix
    ./stylix.nix
    ./systemd.nix
    ./virtmanager.nix
    ./xdg-portal.nix
    # Rin only 
    ./audiobookshelf.nix
    ./borgbackup.nix
    ./nextcloud.nix
  ];
}
