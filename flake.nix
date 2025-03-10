{
  description = "NixOS configuration";

  inputs = {
      nixpkgs.url = "github:NixOS/nixpkgs/nixos-24.11";
      home-manager = {
          url = "github:nix-community/home-manager/release-24.11";
          inputs.nixpkgs.follows = "nixpkgs";
      };
  };

  outputs = inputs@{ nixpkgs, home-manager, ... }: {
    nixosConfigurations = {
        # greynix - Gray Asus machine
        greynix = nixpkgs.lib.nixosSystem {
        system = "x86_64-linux";
        modules = [
          ./mods/base.nix
          ./greynix/configuration.nix
          ./mods/docker.nix
          
          home-manager.nixosModules.home-manager
          {
            home-manager.useGlobalPkgs = true;
            home-manager.useUserPackages = true;
            home-manager.users.elias = import ./mods/home.nix;

            # Optionally, use home-manager.extraSpecialArgs to pass
            # arguments to home.nix
          } 

        ]; 
       }; 

    }; 
  }; 
}
