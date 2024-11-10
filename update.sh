# add things to git
git add .
git commit -m "Update NixOS config."
git push origin main

# update nixos
# sudo nixos-rebuild switch --flake .#HOST
#sudo nixos-rebuild switch --flake '.#greynix'
#sudo nixos-rebuild switch --flake '.#bluenix'

# flake update
# sudo nix flake update

# check on things
# git status
