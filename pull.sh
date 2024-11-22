# pull new stuff down
echo "pulling nixos config from git repo"
git pull origin main

# update nixos
# sudo nixos-rebuild switch --flake .#HOST
#sudo nixos-rebuild switch --flake '.#greynix'
#sudo nixos-rebuild switch --flake '.#bluenix'

# flake update
# sudo nix flake update

# check on things
# git status
