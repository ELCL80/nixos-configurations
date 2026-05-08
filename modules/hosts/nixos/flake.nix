{
    description = "Nixos Configuration";

    inputs = {
        # Unstable (Rolling)
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        zen-browser = {
            url = "github:0xc000022070/zen-browser-flake";
            inputs = {
                nixpkgs.follows = "nixpkgs";
                home-manager.follows = "home-manager";
            };
        };
       home-manager.inputs.nixpkgs.follows = "nixpkgs";
        
        # Stable 
        nixpkgs-stable.url = "nixpkgs/nixos-25.11";
        home-manager-stable.url = "github:nix-community/home-manager/release-25.11";
        home-manager-stable.inputs.nixpkgs.follows = "nixpkgs-stable";

        # Other
        nvim-config = {
            url = github:ELCL80/nvim-dotfiles;
            flake = false;
        };
    };

    outputs = inputs@{ self, nixpkgs, home-manager, nixpkgs-stable, home-manager-stable, ... }: {
        nixosConfigurations  = {
            nova = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                    ./modules/hosts/nova/configuration.nix
                    { nixpkgs.config.allowUnfree = true; }
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.extraSpecialArgs = { inherit inputs; };
                        home-manager.users.kyle = {
                            imports = [ ./modules/hosts/nova/home.nix ];
                        };
                        home-manager.backupFileExtension = "backup";
                    }
                ];
            };
            nixos = nixpkgs-stable.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                    ./modules/hosts/nixos/configuration.nix
                    { nixpkgs.config.allowUnfree = true; }
                    home-manager-stable.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.extraSpecialArgs = { inherit inputs; };
                        home-manager.users.alpha = {
                            imports = [ ./modules/hosts/nixos/home.nix ];
                        };
                        home-manager.backupFileExtension = "backup";
                    }
                ];
            };
        };
    };
}
