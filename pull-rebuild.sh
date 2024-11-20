# pull new stuff down
git pull origin main
echo "rebuilding" $(hostname) "from git repo"
git pull origin main

# build it
sudo nixos-rebuild switch --flake '.#$(hostname)'

# update nixos
# sudo nixos-rebuild switch --flake .#HOST
#sudo nixos-rebuild switch --flake '.#greynix'
#sudo nixos-rebuild switch --flake '.#bluenix'

# flake update
# sudo nix flake update

# check on things
# git status
