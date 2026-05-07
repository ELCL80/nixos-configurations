{ config, lib, pkgs, inputs, ... }: {
    environment = {
    	systemPackages = with pkgs; [
            vim 
            wget
            git
            unzip
            curl
            gnumake
        ];

    	shells = [
            "/etc/profiles/per-user/kyle/bin/zsh"
        ];
    };
}
