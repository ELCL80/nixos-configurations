{ config, lib, pkgs, inputs, ... }: {
    home.packages = with pkgs; [
        wineWow64Packages.staging
        wineWow64Packages.waylandFull
        winetricks
    ];
}