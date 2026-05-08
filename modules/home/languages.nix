{ config, lib, pkgs, inputs, ... }: {
    home.packages = with pkgs; [
        nodejs 
        ghc
        haskell-language-server
    ];
}
