{ config, lib, pkgs, inputs, ... }: {
    home = {
        packages = with pkgs; [
            zsh-powerlevel10k
            nerd-fonts.meslo-lg
            nerd-fonts.jetbrains-mono
        ];
    };
    programs = {
        zsh = {
            enable = true;
            initContent = "source ~/.p10k.zsh";
            shellAliases = {
                rebuild = "sudo nixos-rebuild switch";
                nixconf = "sudo nvim /etc/nixos/modules/hosts/nova";
            };
            plugins = [
                {
                  name = "powerlevel10k-config";
                  src = pkgs.zsh-powerlevel10k;
                  file = "share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
                }
            ];
            oh-my-zsh = {
                enable = true;
            };
        };
        zoxide.enable = true;
    };
}

