{ config, lib, pkgs, inputs, ... }: {
    networking = {
    	hostName = "nova"; 

    	networkmanager.enable = true;
    };
}
