{ config, lib, pkgs, inputs, ... }: {
    imports = [
        ./languages.nix
    ];
    home = {
        packages = with pkgs; [
            tree
	        neovim
            tmux
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
