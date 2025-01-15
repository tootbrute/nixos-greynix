{ config, pkgs, lib, ... }:

# for Accelerated Video Playback
# https://wiki.nixos.org/wiki/Accelerated_Video_Playback
{
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      intel-media-driver # For Broadwell (2014) or newer processors. LIBVA_DRIVER_NAME=iHD
      intel-vaapi-driver # For older processors. LIBVA_DRIVER_NAME=i965, works better for firefox/chromium?
    ];
  };
  environment.sessionVariables = { LIBVA_DRIVER_NAME = "iHD"; }; # Optionally, set the environment variable
}

# for Quick Sync Video
  hardware.graphics = {
    enable = true;
    extraPackages = with pkgs; [
      vpl-gpu-rt # or intel-media-sdk for QSV
    ];
  };
