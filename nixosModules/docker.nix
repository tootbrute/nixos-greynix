{ pkgs, lib, config, ... }:
# enable docker

{

    # Enable Docker
    virtualisation.docker = {
      enable = true;
      autoPrune = {
        enable = true;
      };
    };
}
