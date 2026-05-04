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
    };

    users.users.kyle = {
        isNormalUser = true;
        shell = "/etc/profiles/per-user/kyle/bin/zsh";
        extraGroups = [ "wheel" ]; 
        packages = with pkgs; [
            tree
        ];
    };
    programs = {
    	firefox.enable = true;
    	steam.enable = true;
    	niri.enable = true;
        neovim = {
            enable = true;
            configure = {
                customRC = ''
                    set number relativenumber
                    set autoindent
                    set smartindent
                    set tabstop=4
                    set softtabstop=4
                    set shiftwidth=4
                    set expandtab
                '';
            };
        };
    };

    environment = {
    	systemPackages = with pkgs; [
            vim 
            wget
            git
            alacritty
            tmux
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

