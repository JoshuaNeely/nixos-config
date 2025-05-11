{ config, lib, pkgs, modulesPath, ... }:

# with pkgs prepends the pkgs prefix to each entry
# without it you would need "pkgs.package_1" "pkgs.package_2" etc
{
    environment.systemPackages = with pkgs; [
        git
        wget
        vim
    ];
}
