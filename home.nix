{ config, lib, pkgs, ... }: {

    home = {
        username = "kyle";
        homeDirectory = "/home/kyle";
        stateVersion = "25.11";
        packages = with pkgs; [ zsh-powerlevel10k meslo-lgs-nf ];
    };
    programs = {
        git.enable = true;
        bash = {
            enable = true;
            shellAliases = {
                rebuild = "sudo nixos-rebuild switch";
                nixconf = "sudo vim /etc/nixos/";
            };
        };

        zsh = {
            enable = true;
            initContent = "source ~/.p10k.zsh";
            shellAliases = {
                rebuild = "sudo nixos-rebuild switch";
                nixconf = "sudo vim /etc/nixos/";
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

        neovim = {
            enable = true;
	    withPython3 = true;
	    withRuby = false;
        };
    };
}
