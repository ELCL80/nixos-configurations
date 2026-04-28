{
    description = "Nixos Configuration";

    inputs = {
        nixpkgs.url = "nixpkgs/nixos-unstable";
        home-manager.url = "github:nix-community/home-manager";
        home-manager.inputs.nixpkgs.follows = "nixpkgs";
        hyprland.url = "github:hyprwm/Hyprland";
    };

    outputs = inputs@{ self, nixpkgs, home-manager, ... }: {
        nixosConfigurations.nixos = nixpkgs.lib.nixosSystem {
            system = "x86_64-linux";
            specialArgs = { inherit inputs; };
            modules = [
                ./configuration.nix
                home-manager.nixosModules.home-manager {
                    home-manager.useGlobalPkgs = true;
                    home-manager.useUserPackages = true;
                    home-manager.extraSpecialArgs = { inherit inputs; };
                    home-manager.users.kyle = ./home.nix;
                    home-manager.backupFileExtension = "backup";
                }
            ];
        };
    };
}
