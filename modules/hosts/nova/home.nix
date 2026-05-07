{ config, lib, pkgs, inputs, ... }: {

    imports = [
        ./../../development.nix
        ./../../shell.nix
    ];

    home = {
        username = "kyle";
        homeDirectory = "/home/kyle";
        stateVersion = "25.11";

    };
}
