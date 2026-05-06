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
    	displayManager.sddm.enable = true;
    };

    users.users.alpha = {
        isNormalUser = true;
        shell = "/etc/profiles/per-user/kyle/bin/zsh";
        extraGroups = [ "wheel" ]; 
        packages = with pkgs; [
            tree
        ];
    };
    programs = {
    	firefox.enable = true;
    };

    environment = {
    	systemPackages = with pkgs; [
            vim 
            wget
            git
        ];
    };

    nix.settings = {
        experimental-features = [ "nix-command" "flakes" ];
    };

    system.stateVersion = "25.11";
}

