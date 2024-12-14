{ config, pkgs, ... }:

{
  # Fonts
  fonts.packages = with pkgs; [  
    corefonts  
    vistafonts  
    noto-fonts  
    noto-fonts-cjk-sans  
    noto-fonts-cjk-serif  
    noto-fonts-emoji  
    liberation_ttf  
    fira-code  
    fira-code-symbols  
    mplus-outline-fonts.githubRelease  
    dina-font  
    proggyfonts
#    pkgs.nerd-fonts._0xproto # can't get nerd fonts working again
#    pkgs.nerd-fonts.droid_sans_mono
  ];

  fonts.fontDir.enable = true;
}
