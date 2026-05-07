{ config, lib, pkgs, inputs, ... }: {

    imports = [
        ./../../home/development.nix
        ./../../home/shell.nix
    ];

    home = {
        username = "kyle";
        homeDirectory = "/home/kyle";
        stateVersion = "25.11";

    };
}
