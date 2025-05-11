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
      ";
    };
    
    home.stateVersion = "24.11";
  };
}
