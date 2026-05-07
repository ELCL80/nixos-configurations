{ config, lib, pkgs, inputs, ... }: {

    users.users.kyle = {
        isNormalUser = true;
        shell = "/etc/profiles/per-user/kyle/bin/zsh";
        extraGroups = [ "wheel" ]; 
    };
}
