{ config, lib, pkgs, inputs, ... }: {
    home = {
        packages = with pkgs; [
            tree
	    neovim
            nodejs 
            haskell-language-server
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
