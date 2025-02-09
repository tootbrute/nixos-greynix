{ config, pkgs, lib, ... }:

# for Accelerated Video Playback
# https://wiki.nixos.org/wiki/Accelerated_Video_Playback
{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # For Broadwell (2014) or newer processors. LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # For older processors. LIBVA_DRIVER_NAME=i965, works better for firefox/chromium?
      vpl-gpu-rt # For Quick Sync Video
    ];
  };
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Optionally, set the environment variable
}
