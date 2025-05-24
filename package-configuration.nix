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
        stow
        killall

        # editors
        vim
        neovim
        emacs
          ripgrep # used by doom emacs
          fd # used by doom emacs
          cmake # used for compiling some packages
          gnumake # used for compiling some packages
          libtool # used for compiling some packages

        # password manager
        gnupg
        pass
        pinentry-curses

        # games
        steamcmd
        discord
        sunshine

        # browser
        firefox

        # helps find keycodes that hypr config uses (and other tools?)
        wev

        # file manager
        yazi

        # terminals
        kitty

        # hyprland stuff
        waybar # configurable topbar
        dunst # notifation daemon
        libnotify # needed for notification daemons
        swww # wallpaper daemon
        rofi-wayland # app launcher and window switcher
        wl-clipboard # expose wl-copy and wl-paste
        networkmanagerapplet # adds a widget to waybar(?) that allows choosing network
        hypridle # handles detecting idleness and forwarding signals, including lock signals
        hyprlock # lock screen
    ];

    security.wrappers.sunshine = {
      owner = "root";
      group = "root";
      capabilities = "cap_sys_admin+p";
      source = "${pkgs.sunshine}/bin/sunshine";
    };

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


