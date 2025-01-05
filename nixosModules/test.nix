{ pkgs, lib, config, ... }:
# enable docker
# not all systems need this

{

  options = {

  };

  config = {
    # Enable Docker
    virtualisation.docker.enable = true;
  };

}
