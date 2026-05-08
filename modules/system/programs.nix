{ config, lib, pkgs, inputs, ... }: {
    programs = {
    	firefox.enable = true;
    	steam.enable = true;
        joycond-cemuhook.enable = true;
    };
}

