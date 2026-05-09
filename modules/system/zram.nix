{ config, lib, pkgs, inputs, ... }: {
    zramSwap = {
        enable = true;
        algorithm = "zstd";
        memoryPercent = 50;
    };
}
