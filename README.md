# My NixOS Flake Config
My NixOS repo with that has the configs for 2 of my NixOS machines.

## NOTE: Archived.
I don't use this anymore. It got too complicated with multiple machines.

# Structure of NixOS Config

```.
├── flake.lock
├── flake.nix
├── flatpak-install.sh
├── home.nix
├── hosts
│   ├── aspirenix
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   ├── bluenix
│   │   ├── configuration.nix
│   │   └── hardware-configuration.nix
│   └── greynix
│       ├── configuration.nix
│       └── hardware-configuration.nix
├── nixosModules
│   ├── base.nix
│   ├── docker.nix
│   ├── fonts.nix
│   ├── gnome.nix
│   ├── module-docker.nix
│   ├── module-modules.nix
│   └── systemd.nix
├── nix-upgrade.sh
├── pull.sh
├── README.md
├── rebuild.sh
├── temp-non-declarative-stuff.txt
└── update.sh
```
