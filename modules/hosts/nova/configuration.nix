{ config, lib, pkgs, inputs, ... }: {

    imports = [ 
        ./hardware-configuration.nix
    ];

    boot = {
    	loader.systemd-boot.enable = true;
    	loader.efi.canTouchEfiVariables = true;

    	kernelPackages = pkgs.linuxPackages_latest;
    };

    virtualisation.virtualbox.guest.enable = false;

    networking = {
    	hostName = "nova"; 

    	networkmanager.enable = true;
    };

    time.timeZone = "America/Jamaica";

    services = {
    	xserver = {
            enable = true;
            desktopManager = {
                xterm.enable = false;
                xfce.enable = true;
            };
        };
    	displayManager.ly.enable = true;
    	openssh.enable = true;
        joycond.enable = true;
    };

    users.users.kyle = {
        isNormalUser = true;
        shell = "/etc/profiles/per-user/kyle/bin/zsh";
        extraGroups = [ "wheel" ]; 
    };
    programs = {
    	firefox.enable = true;
    	steam.enable = true;
    	niri.enable = true;
        joycond-cemuhook.enable = true;
    };

    environment = {
    	systemPackages = with pkgs; [
            vim 
            wget
            git
            unzip
            curl
            gnumake
            neovim
        ];

    	shells = [
            "/etc/profiles/per-user/kyle/bin/zsh"
        ];
    };

    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
    };

    system.stateVersion = "25.11";
}
