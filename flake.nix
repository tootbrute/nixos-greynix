{
  description = "NixOS configuration";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
      #nixpkgs.url = "github:nixos/nixpkgs/nixos-unstable";
      home-manager = {
          url = "github:nix-community/home-manager";
          inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
        # greynix - Gray Asus machine
        greynix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./nixosModules/base.nix
          ./greynix/configuration.nix
          ./nixosModules/docker.nix
          
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.elias = import ./nixosModules/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          } 
        ]; 
       }; 

    }; 
  }; 
}
