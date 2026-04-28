{ config, lib, pkgs, ... }: {

    imports = [ 
        ./hardware-configuration.nix
    ];

    boot.loader.systemd-boot.enable = true;
    boot.loader.efi.canTouchEfiVariables = true;

    boot.kernelPackages = pkgs.linuxPackages_latest;

    virtualisation.virtualbox.guest.enable = false;

    networking.hostName = "nixos"; # Define your hostname.

    networking.networkmanager.enable = true;

    time.timeZone = "America/Jamaica";

    services.xserver = {
        enable = true;
        desktopManager = {
            xterm.enable = false;
            xfce.enable = true;
        };
    };
    services.displayManager.ly.enable = true;

    services.openssh.enable = true;

    users.users.kyle = {
        isNormalUser = true;
        extraGroups = [ "wheel" ]; 
        packages = with pkgs; [
            tree
        ];
    };

    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
        vim 
        wget
        git
    ];

    nix.settings.experimental-features = [ "nix-command" "flakes" ];

    system.stateVersion = "25.11";
}

