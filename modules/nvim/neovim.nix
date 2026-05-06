{ config, lib, pkgs, ... }: {
    programs.neovim = {
        enable = true;
        generatedConfigs = {
            lua = ''
                dofile("init.lua")
            '';
        };
    };
}
