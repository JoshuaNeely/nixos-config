{ config, pkgs, lib, ... }:

let
  home-manager = builtins.fetchTarball https://github.com/nix-community/home-manager/archive/release-24.11.tar.gz;
in
{
  imports = [ 
    (import "${home-manager}/nixos")
  ];

  users.users.josh.isNormalUser = true;
  home-manager.users.josh = { pkgs, ...}: {
    home.packages = [];
    programs.bash.enable = true;

    programs.git = {
      enable = true;
      extraConfig = {
	user.name = "Joshua Neely";
	user.email = "joshua.a.neely@gmail.com";
	init.defaultBranch = "main";
      };
    };

    programs.vim = {
      enable = true;
      extraConfig = "
	set ruler
 	set shiftwidth=2
	set number
	set autoindent

        noremap <S-Y> :w! /tmp/vimcopy<CR>
        noremap <S-D> :w! /tmp/vimcopy <bar> :d<CR>
        noremap <S-P> :r /tmp/vimcopy<CR>
      ";
    };

    dconf = {
      enable = true;
      settings = {
        "org/gnome/shell" = {
          disable-user-extensions = false;

          # use `dconf watch /`, then poke at gnome settings, to find these values
          disabled-extensions = [
            "apps-menu@gnome-shell-extensions.gcampax.github.com"
            "auto-move-windows@gnome-shell-extensions.gcampax.github.com"
            "light-style@gnome-shell-extensions.gcampax.github.com"
            "native-window-placement@gnome-shell-extensions.gcampax.github.com"
            "places-menu@gnome-shell-extensions.gcampax.github.com"
            "screenshot-window-sizer@gnome-shell-extensions.gcampax.github.com"
            "user-theme@gnome-shell-extensions.gcampax.github.com"
            "window-list@gnome-shell-extensions.gcampax.github.com"
            "windowsNavigator@gnome-shell-extensions.gcampax.github.com"
            "workspace-indicator@gnome-shell-extensions.gcampax.github.com"
          ];

          enabled-extensions = [
            "drive-menu@gnome-shell-extensions.gcampax.github.com"
            "status-icons@gnome-shell-extensions.gcampax.github.com"
            "system-monitor@gnome-shell-extensions.gcampax.github.com"
            "launch-new-instance@gnome-shell-extensions.gcampax.github.com"
          ];
        };
      };
    };

    home.stateVersion = "24.11";
  };
}
