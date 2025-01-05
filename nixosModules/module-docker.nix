{ pkgs, lib, config, ... }:
# enable docker
# not all systems need this

{

  options = {
    dockerModule.enable =
      lib.mkEnableOption "enables Docker Module";
  };

  config = lib.mkIf config.dockerModule.enable {

    # Enable Docker
    virtualisation.docker = {
      enable = true;
      autoPrune = {
        enable = true;
      };
    };

  };

}
