# build it
HOSTNAME=$(hostname)

sudo nixos-rebuild switch --flake '.#$HOSTNAME'
