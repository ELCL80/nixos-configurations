{
    description = "Nixos Configuration";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
        nixosConfigurations  = {
            nova = nixpkgs.lib.nixosSystem {
                system = "x86_64-linux";
                specialArgs = { inherit inputs; };
                modules = [
                    ./hosts/nova/configuration.nix
                    { nixpkgs.config.allowUnfree = true; }
                    home-manager.nixosModules.home-manager {
                        home-manager.useGlobalPkgs = true;
                        home-manager.useUserPackages = true;
                        home-manager.extraSpecialArgs = { inherit inputs; };
                        home-manager.users.kyle = {
                            imports = [ ./hosts/nova/home.nix ];
                        };
                        home-manager.backupFileExtension = "backup";
                    }
                ];
            };
        };
    };
}
