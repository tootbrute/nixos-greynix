nix flake update
sudo nixos-rebuild switch --flake '.#'$(hostname)'' --upgrade
