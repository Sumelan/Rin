{
  description = "My system configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    nixpkgs-stable.url = "github:nixos/nixpkgs/nixos-23.11";
    spicetify-nix.url = "github:the-argus/spicetify-nix";
    catppuccin.url = "github:catppuccin/nix";
    fine-cmdline = {
      url = "github:VonHeikemen/fine-cmdline.nvim";
      flake = false;
    };
    disko = {
      url = "github:nix-community/disko";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    home-manager = {
      url = "github:nix-community/home-manager";
      inputs.nixpkgs.follows = "nixpkgs";
    };
  };
  outputs = { nixpkgs, catppuccin, home-manager, spicetify-nix, ... }@inputs:

    let
      system = "x86_64-linux";

      # User Variables
      hostname = "Rin";
      username = "bathys";
      gitUsername = "bathys";
      gitEmail = "bathys@proton.me";
      theme = "catppuccin-macchiato";
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
            catppuccin.nixosModules.catppuccin
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
              home-manager.users.${username} = {
               imports = [
                  ./home-manager/home.nix
                  catppuccin.homeManagerModules.catppuccin
                ];
              };
            } 
          ];
        };
      };
    };
  }
