# My NixOS Flake Config
My attempt to have one repo and set of config files for both of my NixOS machines.

My thoughts before is started this are [here](https://blog.arkadi.one/p/nixos-multiple-machine-flake/).

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
