# My NixOS Flake Config
My NixOS repo with that has the configs for 2 of my NixOS machines.

**Note to self:**
I have no files in /etc/nixos now. I wonder if I should `ln` them there. Hmm.

## Notes for newbies on how to use this
1. Change hostnames in the flake
2. Update things back up to github with:
```
git add . #add all files
git commit -m "Update NixOS config." #commit message
git push origin main #put updated files in git repo
```
3. In the ./nixos-config, deploy this with the command `sudo nixos-rebuild switch --flake .#HOSTNAME`

# Structure of NixOS Config
```
└── nixos-config
   ├── base.nix
   ├── bluenix
   │   ├── configuration.nix
   │   └── hardware-configuration.nix
   ├── flake.nix
   ├── fonts.nix
   ├── gnome.nix
   ├── greynix
   │   ├── configuration.nix
   │   └── hardware-configuration.nix
   ├── home.nix
   └── systemd.nix
```
