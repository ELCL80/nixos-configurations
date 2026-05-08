{ config, lib, pkgs, inputs, ... }: {
    hardware.graphics = { 
        enable = true;
        driSupport = true;
        driSupport32Bit = true;
    };
    services.xserver.videoDriver = ["amdgpu"];

    programs = {
    	steam.enable = true;
        gamemode.enable = true;
        joycond-cemuhook.enable = true;
    };
    services.joycond.enable = true;

    environment.systemPackages = with pkgs; [
        protonup
    ];
    environment.sessionVariables = {
        STEAM_EXTRA_COMPAT_TOOLS_PATH = "/home/kyle/.steam/root/compatibilitytools.d";
    };
}