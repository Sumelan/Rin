{
  imports = [
    ./bluetooth.nix
    ./bootloader.nix
    ./env.nix
    ./network.nix
    ./nixvim/nixvim.nix
    ./security.nix
    ./services.nix
    ./sound.nix
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
