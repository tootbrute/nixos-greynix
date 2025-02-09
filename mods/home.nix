{ config, pkgs, ... }:

{
  home.username = "elias";
  home.homeDirectory = "/home/elias";

  # link the configuration file in current directory to the specified location in home directory
  # home.file.".config/i3/wallpaper.jpg".source = ./wallpaper.jpg;

  # link all files in `./scripts` to `~/.config/i3/scripts`
  # home.file.".config/i3/scripts" = {
  #   source = ./scripts;
  #   recursive = true;   # link recursively
  #   executable = true;  # make all files executable
  # };

  # encode the file content in nix configuration file directly
  # home.file.".xxx".text = ''
  #     xxx
  # '';

  # Packages that should be installed to the user profile.
  home.packages = with pkgs; [

  ];

  # Environment
  home.sessionVariables = {
    EDITOR = "nano";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  # Basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Tootbrute";
    userEmail = "tootbrute@tutamail.com";
    extraConfig = {
    init.defaultBranch = "main";
    };
  };

  # Starship - an customizable prompt for any shell
  programs.starship = {
    enable = true;
    # custom settings
    settings = {
      add_newline = false;
      aws.disabled = true;
      gcloud.disabled = true;
      line_break.disabled = true;
    };
  };

  # alacritty - a cross-platform, GPU-accelerated terminal emulator
  programs.alacritty = {
    enable = true;
    # custom settings
    settings = {
      env.TERM = "xterm-256color";

    font = {
      normal = {
	family = "JetBrains Mono Nerd Font";
	style = "Regular";
      };
      bold = {
	family = "JetBrains Mono Nerd Font";
	style = "Bold";
      };
      italic = {
	family = "JetBrains Mono Nerd Font";
	style = "Italic";
      };
  };

      font = {
        size = 20;
      };

      window.dimensions = {
        lines = 40;
        columns = 200;
      };
      scrolling.multiplier = 5;
      selection.save_to_clipboard = true;
    };
  };

  #GNOME desktop settings
  dconf.settings = {
    "org/gnome/desktop/interface" = {
      color-scheme = "prefer-dark";
    };
    # Set Wallpaper
    "org/gnome/desktop/background" = {
        "picture-uri" = "/home/elias/.background-image";
        "picture-uri-dark" = "/home/elias/.background-image";
    };
  };

  # Create Wallpaper file for use with GNOME Dconf settings
  home.file.".background-image" = {
    source = ./files/wallpaper.png;
  };

  gtk = {
    enable = true;

    gtk3.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };

    gtk4.extraConfig = {
      Settings = ''
        gtk-application-prefer-dark-theme=1
      '';
    };
  };

  programs.bash = {
    enable = true;
    enableCompletion = true;
    bashrcExtra = ''
      export PATH="$PATH:$HOME/bin:$HOME/.local/bin:$HOME/go/bin"
    '';
  };

/*
  # neovim setup
  vim = {
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
*/

  # This value determines the home Manager release that your
  # configuration is compatible with. This helps avoid breakage
  # when a new home Manager release introduces backwards
  # incompatible changes.
  #
  # You can update home Manager without changing this value. See
  # the home Manager release notes for a list of state version
  # changes in each release.
  home.stateVersion = "24.05";

  # Let home Manager install and manage itself.
  programs.home-manager.enable = true;
}
