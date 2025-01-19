# base.nix
# configuration for all my computers

{ pkgs, config, lib, ... }:

{
  imports =
    [ 
      ./gnome.nix
      ./systemd.nix
      ./fonts.nix
      ./intel-gpu.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;
  boot.loader.grub.configurationLimit = 10;

  # Clear /tmp during boot
  boot.tmp.cleanOnBoot = true;

  # Housekeeping: Garbage collection
  nix.optimise.automatic = true;

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 7d";
  };

  # increase buffer size
  nix.settings.download-buffer-size = "2G";

  # Enable networking
  networking.networkmanager.enable = true;

  # Disable sudo password for the wheel group
  security.sudo.wheelNeedsPassword = false;

  # Set your time zone.
  time.timeZone = "Asia/Taipei";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";
  i18n.supportedLocales = [ "en_US.UTF-8/UTF-8" "zh_CN.UTF-8/UTF-8" "zh_TW.UTF-8/UTF-8" ];

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "en_US.UTF-8";
    LC_IDENTIFICATION = "en_US.UTF-8";
    LC_MEASUREMENT = "en_US.UTF-8";
    LC_MONETARY = "en_US.UTF-8";
    LC_NAME = "en_US.UTF-8";
    LC_NUMERIC = "en_US.UTF-8";
    LC_PAPER = "en_US.UTF-8";
    LC_TELEPHONE = "en_US.UTF-8";
    LC_TIME = "en_US.UTF-8";
  };

  i18n.inputMethod = {
    enable = true;
    type = "fcitx5";
    fcitx5.addons = with pkgs; [
      fcitx5-chewing
      fcitx5-chinese-addons
      fcitx5-table-extra
    ];
  };
    

#  il8n.inputMethod.enabled = "fcitx5";
#  il8n.inputMethod.fcitx5.addons = with pkgs; [
#    fcitx5-chewing
#    fcitx5-chinese-addons
  #what is for pinyin?
#  ];

# trying FCITX5 first
#  i18n.inputMethod = {
#    enable = true;
#    type = "ibus";
#    ibus.engines = with pkgs.ibus-engines; [ libpinyin table-chinese];
#   };

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  # Enable the GNOME Desktop Environment.
  services.xserver.displayManager.gdm.enable = true;
  services.xserver.desktopManager.gnome.enable = true;
  # remove xterm
  services.xserver.excludePackages = [ pkgs.xterm ];
  services.xserver.desktopManager.xterm.enable = false; 

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us";
    variant = "";
  };

  # Enable CUPS to print documents.
  services.printing.enable = false;

  # Enable sound with pipewire.
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    #jack.enable = true;

    # use the example session manager (no others are packaged yet >
    # no need to redefine it in your config for now)
    #media-session.enable = true;
  };

  # Enable automatic login for the user.
  services.displayManager.autoLogin.enable = true;
  services.displayManager.autoLogin.user = "elias";

  # Workaround for GNOME autologin: https://github.com/NixOS/nixpk>
  systemd.services."getty@tty1".enable = false;
  systemd.services."autovt@tty1".enable = false;

  # PROGRAMS
  # ================
  # Install Firefox.
  programs.firefox.enable = true;
  
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  nix.settings.experimental-features = [ "nix-command" "flakes" ];
  environment.systemPackages = with pkgs; [
  #  vim # Do not forget to add an editor to edit configuration.ni>
    # terminal apps
    wget
    curl
    fastfetch
    git
    btop
    htop
    ptyxis

    # core apps
    iotas
    curl
    keepassxc
    nextcloud-client
    libreoffice-fresh
    hunspell #dictionaries for libreoffice
    hunspellDicts.en_CA
    hunspellDicts.en_US

    restic
    kdePackages.kdenlive
    audacity
    gimp
    krita
    element-desktop

    ibus
    ibus-with-plugins
    libchewing

    #gaming
    dosbox

    #gpu tools
    intel-gpu-tools
    #nvtopPackages.full not working right now
  ];

  # Services
  # =========================

  # Enable OpenSSH
  services.openssh.enable = true;

  # Enable Flatpak
  services.flatpak.enable = true;

  # Enable Tailscale
  services.tailscale.enable = true;

  # Enable Docker
  #virtualisation.docker.enable = true;

}
