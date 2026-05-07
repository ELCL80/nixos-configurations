{ config, lib, pkgs, inputs, ... }: {

    imports = [ 
        ./hardware-configuration.nix
        ./../../system/boot.nix
        ./../../system/networking.nix
        ./../../system/programs.nix
        ./../../system/environment.nix
        ./../../system/users.nix
        ./../../system/services.nix
    ];

    virtualisation.virtualbox.guest.enable = false;


    time.timeZone = "America/Jamaica";


    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
    };

    system.stateVersion = "25.11";
}
