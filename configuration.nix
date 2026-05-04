{ config, lib, pkgs, inputs, ... }: {

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

    programs.niri = {
        enable = true;
    };

    services.displayManager.ly.enable = true;

    services.openssh.enable = true;

    users.users.kyle = {
        isNormalUser = true;
        shell = "/etc/profiles/per-user/kyle/bin/zsh";
        extraGroups = [ "wheel" ]; 
        packages = with pkgs; [
            tree
        ];
    };

    programs.firefox.enable = true;
    programs.steam.enable = true;

    environment.systemPackages = with pkgs; [
        vim 
        wget
        git
        alacritty
    ];

    environment.shells = [
        "/etc/profiles/per-user/kyle/bin/zsh"
    ];

    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
    };

    system.stateVersion = "25.11";
}

