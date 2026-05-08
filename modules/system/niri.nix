{ config, lib, pkgs, inputs, ... }: {
    programs = {
    	niri.enable = true;
    };
    environment.systemPackages = with pkgs; [ alacritty ];
}

