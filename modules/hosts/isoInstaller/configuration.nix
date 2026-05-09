{ pkgs, modulesPath, inputs, ... }: {

    imports = [
        "${modulesPath}/installer/cd-dvd/installation-cd-minimal.nix"
    ];

    nixpkgs.hostPlatform = "x86_64-linux";

    environment.systemPackages = with pkgs; [
        neovim
        parted
        disko
        git
        alacritty
        fuzzel
        tmux
    ];

    fonts.enableDefaultPackages = true;
    
    networking.networkmanager.enable = true;

    programs.niri.enable = true;
    programs.firefox.enable = true;

    environment.etc."nixos-ELCL".source = inputs.nixos-configurations;
    
    programs.bash.shellAliases = {
        install-init = ''
            sudo -i
            nixos-generate-config --root /mnt
            cd /mnt/etc/nixos
            rm configuration.nix
            mkdir temp
            mv hardware-configuration.nix temp
            cp -r /etc/nixos-ELCL/* /mnt/etc/nixos
            mv -f temp/hardware-configuration.nix .
            rp -rf temp
            exit
        '';
    };

    nix.settings.experimental-features = [ "nix-command" "flakes" ];
}

