echo "rebuilding" $(hostname) "from git repo"
git pull origin main

# build it
sudo nixos-rebuild switch --flake '.#$(hostname)'
