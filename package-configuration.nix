{ config, lib, pkgs, modulesPath, ... }:

{
    environment.systemPackages = with pkgs; [
        git
        wget
        vim
    ];

    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
        # add dynamic libraries here
    ]
}

