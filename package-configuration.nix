{ config, lib, pkgs, modulesPath, ... }:

{
    nixpkgs.config.allowUnfree = true;

    environment.systemPackages = with pkgs; [
        # dev tools
        git
        wget
        podman
        inotify-tools
        udiskie

        # editors
        vim
        neovim
        emacs
          ripgrep # used by doom emacs
          fd # used by doom emacs

        # password manager
        gnupg
        pass
        pinentry-curses

        # games
        steamcmd
        discord

        # browser
        firefox

        # helps find keycodes that hypr config uses (and other tools?)
        wev

        # app launchers
        hyprlauncher

        # file manager
        yazi

        # terminals
        kitty

        # hyprland stuff
        waybar # configurable topbar
        dunst # notifation daemon
        libnotify # needed for notification daemons
        swww # wallpaper daemon
        rofi-wayland # app launcher
        wl-clipboard # expose wl-copy and wl-paste
        networkmanagerapplet # adds a widget to waybar(?) that allows choosing network
        hypridle # handles detecting idleness and forwarding signals, including lock signals
        hyprlock # lock screen
    ];

    services.pcscd.enable = true;
    programs.gnupg.agent = {
       enable = true;
       enableSSHSupport = true;
    };

    xdg.portal = {
      enable = true;
      extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
    };

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


