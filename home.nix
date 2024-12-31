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
    # here is some command line tools I use frequently
    # feel free to add your own or remove some of them
    
    # font stuff for alacritty
    pkgs.iosevka #font program
    # nerd fonts - https://search.nixos.org/packages?channel=unstable&size=50&sort=relevance&type=packages&query=nerd-fonts
    nerd-fonts.iosevka
    nerd-fonts.iosevka-term
    nerd-fonts.fira-code
    nerd-fonts.fira-mono
    nerd-fonts.roboto-mono
    nerd-fonts.noto
    nerd-fonts.martian-mono
    nerd-fonts.jetbrains-mono
    nerd-fonts.iosevka-term-slab
    nerd-fonts.go-mono
    nerd-fonts.droid-sans-mono
    nerd-fonts.fantasque-sans-mono
    nerd-fonts.ubuntu-mono
    nerd-fonts.hack

    xreader #pdf viewer

    fastfetch
    nnn # terminal file manager

    # archives
    zip
    xz
    unzip
    p7zip

    # utils
    ripgrep # recursively searches directories for a regex pattern
    #jq # A lightweight and flexible command-line JSON processor
    #yq-go # yaml processor https://github.com/mikefarah/yq
    eza # A modern replacement for ‘ls’
    #fzf # A command-line fuzzy finder

    # networking tools
    mtr # A network diagnostic tool
    iperf3
    dnsutils  # `dig` + `nslookup`
    #ldns # replacement of `dig`, it provide the command `drill`
    #aria2 # A lightweight multi-protocol & multi-source command-line download utility
    #socat # replacement of openbsd-netcat
    nmap # A utility for network discovery and security auditing
    #ipcalc  # it is a calculator for the IPv4/v6 addresses

    # misc
    #cowsay
    #file
    #which
    tree
    #gnused
    #gnutar
    #gawk
    #zstd
    #gnupg

    # nix related
    #
    # it provides the command `nom` works just like `nix`
    # with more details log output
    nix-output-monitor

    # productivity
    hugo # static site generator
    glow # markdown previewer in terminal

    btop  # replacement of htop/nmon
    iotop # io monitoring
    iftop # network monitoring
    htop # the classic

    # system call monitoring
    strace # system call monitoring
    ltrace # library call monitoring
    lsof # list open files

    # system tools
    sysstat
    lm_sensors # for `sensors` command
    ethtool
    pciutils # lspci
    usbutils # lsusb

    #test
    libchewing
  ];
  
  programs.git = {
    enable = true;
    userName = "tootbrute";
    userEmail = "tootbrute@tutanota.com";
    extraConfig = {
      init.defaultBranch = "main";
    };
  };

  # Environment
  home.sessionVariables = {
    EDITOR = "nano";
    BROWSER = "firefox";
    TERMINAL = "alacritty";
  };

  # basic configuration of git, please change to your own
  programs.git = {
    enable = true;
    userName = "Tootbrute";
    userEmail = "tootbrute@tutamail.com";
  };

  # starship - an customizable prompt for any shell
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
