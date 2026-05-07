{ config, lib, pkgs, inputs, ... }: {
    programs = {
    	firefox.enable = true;
    	steam.enable = true;
    	niri.enable = true;
        joycond-cemuhook.enable = true;
    };
}

