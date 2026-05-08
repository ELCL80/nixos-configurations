{ config, lib, pkgs, inputs, ... }: {
    imports = [
        ./wine.nix
        ./zen.nix
    ];
    
    home.packages = with pkgs; [
        ubuntu_font_family
    ];
}
