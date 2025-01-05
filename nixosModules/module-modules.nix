{ pkgs, lib, ... }:
# nix file for all modules

{

  imports = [
    ./docker.nix
    #./systemd.nix
    #./gnome.nix
    #./fonts.nix
  ];

  # all modules default to true
  dockerModule.enable = lib.mkDefault false;
  

}
