{ config, lib, pkgs, inputs, ... }: {

    home = {
        username = "kyle";
        homeDirectory = "/home/kyle";
        stateVersion = "25.11";

    };

    imports = [
        ./../../home/development.nix
        ./../../home/shell.nix
        ./../../home/desktop.nix
    ];
}
