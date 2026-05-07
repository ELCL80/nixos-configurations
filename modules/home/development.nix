{ config, lib, pkgs, inputs, ... }: {
    home = {
        packages = with pkgs; [
            tree
            nodejs
        ];

        file.".config/nvim" = {
            source = inputs.nvim-config;
            recursive = true;
        };
    };
    programs = {
        git.enable = true;
        vscode.enable = true;
    };
}
