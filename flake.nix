{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    nix-colors.url = "github:misterio77/nix-colors";
    disko.url = "github:nix-community/disko";
    disko.inputs.nixpkgs.follows = "nixpkgs";
    wallust.url = "git+https://codeberg.org/explosion-mental/wallust?ref=dev";
    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1"; # unstable hyprland
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
      };
   #ags.url = "github:Aylur/ags"; 
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    spicetify-nix.url = "github:the-argus/spicetify-nix";
  };
  outputs = { nixpkgs, home-manager, spicetify-nix, ... }@inputs:

    let
      system = "x86_64-linux";

      # User Variables
      hostname = "Rin";
      username = "bathys";
      gitUsername = "bathys";
      gitEmail = "68154148+bathys@users.noreply.github.com";
      theme = "rose-pine";

      pkgs = import nixpkgs {
        inherit system;
        config = {
          allowUnfree = true;
        };
      };
    in
    {
      nixosConfigurations = {
        "${hostname}" = nixpkgs.lib.nixosSystem {
          specialArgs = {
            inherit system;
            inherit inputs;
            inherit username;
            inherit hostname;
            inherit gitUsername;
            inherit gitEmail;
          };
          modules = [
            ./nixos/configuration.nix
            inputs.nixvim.nixosModules.nixvim
            inputs.disko.nixosModules.disko
            home-manager.nixosModules.home-manager
            {
              home-manager.extraSpecialArgs = {
                inherit username;
                inherit gitEmail;
                inherit inputs;
                inherit gitUsername;
                inherit theme;
                inherit (inputs.nix-colors.lib-contrib { inherit pkgs; }) gtkThemeFromScheme;
                inherit spicetify-nix;
              };
              home-manager.useGlobalPkgs = true;
              home-manager.useUserPackages = true;
              home-manager.backupFileExtension = "backup";
              home-manager.users.${username} = import ./home-manager/home.nix;
            }
          ];
        };
      };
    };
  }
