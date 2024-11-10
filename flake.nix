{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
    home-manager.url = "github:nix-community/home-manager";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
        # greynix - Gray Asus machine
        greynix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /home/elias/nixos-config/base.nix
          /home/elias/nixos-config/greynix/configuration.nix
          
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.elias = import /home/elias/nixos-config/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
        # bluenix - Blue Acer machine
        bluenix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          /home/elias/nixos-config/base.nix
          /home/elias/nixos-config/bluenix/configuration.nix
          
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.elias = import /home/elias/nixos-config/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          }
        ];
      };
    };
  };
};

}
