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
  ];
  
  fonts.fontDir.enable = true;
}
