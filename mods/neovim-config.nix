{ pkgs, lib, ... }:

{
  # neovim setup with NVF
  # https://github.com/NotAShelf/nvf
  programs.nvf = {
    enable = true;

    settings.vim = {
        theme = {
          enable = true;
          name = "gruvbox";
          style = "dark";
        };
    statusLine.lualine.enable = true;
    telescope.enable = true;
    autocomplete.nvim-cmp.enable = true;
    
    languages = {
      enableLSP = true;
      enableTreesitter = true;
      
      nix.enable = true;
      ts.enable = true;
      rust.enable = true;
      };
    };
  };

}
