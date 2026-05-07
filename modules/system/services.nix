{ config, lib, pkgs, inputs, ... }: {
    services = {
    	xserver = {
            enable = true;
            desktopManager = {
                xterm.enable = false;
                xfce.enable = true;
            };
        };
    	displayManager.ly.enable = true;
    	openssh.enable = true;
        joycond.enable = true;
    };
}
