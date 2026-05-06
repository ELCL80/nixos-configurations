{ config, lib, pkgs, ... }: {
    programs.neovim = {
        enable = true;
        extraLuaConfig = = ''
                dofile("init.lua")
        '';
    };
}
