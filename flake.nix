{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixvim = {
      url = "github:nix-community/nixvim";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, home-manager, spicetify-nix, ... }@inputs:

    let
      system = "x86_64-linux";

      # User Variables
      hostname = "Rin";
      username = "bathys";
      gitUsername = "bathys";
      gitEmail = "bathys@proton.me";
      theme = "catppuccin-mocha";

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
