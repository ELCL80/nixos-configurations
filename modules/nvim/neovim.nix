{ config, lib, pkgs, ... }: {
    programs.neovim = {
        enable = true;
        extraLuaConfig = ''
                require("init")
        '';
    };
}
