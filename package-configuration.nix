{ config, lib, pkgs, modulesPath, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        git
        wget
        vim
        steamcmd
        firefox
    ];

    programs.nix-ld.enable = true;
    programs.nix-ld.libraries = with pkgs; [
        # add dynamic libraries here
    ];

    programs.steam = {
      enable = true;
      remotePlay.openFirewall = true;
      dedicatedServer.openFirewall = true;
      localNetworkGameTransfers.openFirewall = true;
    };
}


