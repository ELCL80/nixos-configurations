{ config, lib, pkgs, inputs, ... }: {

    home.packages = with pkgs; [ alacritty ];
    programs.niri.enable = true;
}
