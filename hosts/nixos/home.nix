{ config, lib, pkgs, ... }: {

    home = {
        username = "alpha";
        homeDirectory = "/home/alpha";
        stateVersion = "25.11";
        packages = with pkgs; [];
    };
    programs = {
        bash = {
            enable = true;
            shellAliases = {
                rebuild = "sudo nixos-rebuild switch";
            };
        };
    };
}
