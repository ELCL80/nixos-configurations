{ config, lib, pkgs, inputs, ... }: {

    imports = [ 
        ./hardware-configuration.nix
        ./../../system/boot.nix
        ./../../system/networking.nix
        ./../../system/programs.nix
        ./../../system/environment.nix
        ./../../system/users.nix
        ./../../system/services.nix
        ./../../system/nix.nix
        ./../../system/time.nix
        ./../../system/niri.nix
    ];

    virtualisation.virtualbox.guest.enable = false;

    system.stateVersion = "25.11";
}
