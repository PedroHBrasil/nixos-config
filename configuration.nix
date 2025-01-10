# Edit this configuration file to define what should be installed on
# your system.  Help is available in the configuration.nix(5) man page
# and in the NixOS manual (accessible by running ‘nixos-help’).

{ config, pkgs, ... }:

{
  imports =
    [ # Include the results of the hardware scan.
      ./hardware-configuration.nix
    ];

  # Bootloader.
  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "phawm15r3nixos"; # Define your hostname.
  # networking.wireless.enable = true;  # Enables wireless support via wpa_supplicant.

  # Configure network proxy if necessary
  # networking.proxy.default = "http://user:password@proxy:port/";
  # networking.proxy.noProxy = "127.0.0.1,localhost,internal.domain";

  # Enable networking
  networking.networkmanager.enable = true;

  # Disable IPv6 (suspect issue with my router)
  networking.enableIPv6 = false;

  # Set your time zone.
  time.timeZone = "America/Sao_Paulo";

  # Select internationalisation properties.
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
    LC_ADDRESS = "pt_BR.UTF-8";
    LC_IDENTIFICATION = "pt_BR.UTF-8";
    LC_MEASUREMENT = "pt_BR.UTF-8";
    LC_MONETARY = "pt_BR.UTF-8";
    LC_NAME = "pt_BR.UTF-8";
    LC_NUMERIC = "pt_BR.UTF-8";
    LC_PAPER = "pt_BR.UTF-8";
    LC_TELEPHONE = "pt_BR.UTF-8";
    LC_TIME = "pt_BR.UTF-8";
  };

  # Configure keymap in X11
  services.xserver.xkb = {
    layout = "us,us";
    variant = ",alt-intl";
    options = "grp:win_space_toggle";
  };

  # Bluetooth
  hardware.bluetooth = {
    enable = true;
    powerOnBoot = true;
    settings.General = {
      Enable = "Source,Sink,Media,Socket";
      Experimental = true;
    };
  };
  services.blueman.enable = true;

  # VIDEO NVIDIA
  services.xserver.videoDrivers = ["nvidia"];
  # services.xserver.videoDrivers = ["noveau"];

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
    prime = {
      sync.enable = true;
      intelBusId = "PCI:0:2:0";
      nvidiaBusId = "PCI:1:0:0";
    };
  };

  # OpenGL
  hardware.graphics = {
    enable = true;
    enable32Bit = true;
  }; 


  # AUDIO PIPEWIRE
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
    # If you want to use JACK applications, uncomment this
    jack.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pedrohbrasil = {
    isNormalUser = true;
    description = "Pedro Henrique Brasil";
    extraGroups = [ "networkmanager" "wheel" "audio" "kvm" "adbusers" ];
    packages = with pkgs; [
      
    ];
    shell = pkgs.fish;
  };

  programs = {
    fish.enable = true;
    starship.enable = true;
    adb.enable = true;
  };

  hardware.openrazer = {
    enable = true;
    users = [ "pedrohbrasil" ];
  };

  hardware.keyboard.qmk.enable = true;
  services.udev.packages = [ pkgs.via ];
  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # System
    wl-clipboard
    pavucontrol
    unzip
    appimage-run
    htop-vim
    nvtopPackages.full
    libnotify
    brightnessctl
    gtk2
    gtk3
    gtk4
    qt5.full
    qt6.full

    # Input
    via
    polychromatic

    # UI
    hyprpaper
    hyprcursor
    hyprpicker
    hyprshade
    hyprlock
    hyprshot
    hyprdim
    wofi
    waybar
    mako
    bibata-cursors
    glib
    socat

    # Terminal
    kitty
    tmux
    yazi
    git
    lazygit
    tree
    bat
    ripgrep
    fd

    # Browser
    firefox
    chromium

    # Network
    curl
    wget
    insomnia
    ciscoPacketTracer8

    # Media
    spotify
    vlc
    obs-studio

    # Editors
    obsidian
    neovim
    android-studio
    libreoffice-qt
    inkscape

    # Neovim stuff
    tree-sitter
    delta
    hunspell
    hunspellDicts.en_US
    hunspellDicts.pt_BR

    # Development Tools
    android-tools
    android-studio-tools
    firebase-tools

    # Programming Languages
    gnumake
    flutter
    lua51Packages.lua
    ruby
    rustc
    cargo
    gcc
    hyprlang
    jdk
    nodejs_18
    python3Full
    eww

    # LSP
    lua-language-server
    nixd
    hyprls
    vscode-langservers-extracted

    # Code Formatters
    stylua

    # Comunication
    discord

  ];

  # Corrects android adb path
  system.userActivationScripts = {
    stdio = {
      text = ''
        rm -f ~/Android/Sdk/platform-tools/adb
        ln -s /run/current-system/sw/bin/adb ~/Android/Sdk/platform-tools/adb
      '';
      deps = [
      ];
    };
  };

  # GUI
  services.xserver.enable = true;
  # services.xserver.desktopManager.gnome.enable = true;

  console = {
    enable = true;
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = [ pkgs.terminus_font ];
    useXkbConfig = true;
  };

  services.greetd = {
    enable = true;
    settings.default_session.command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
  };

  programs.hyprland = {
    enable = true;
    xwayland.enable = true;
  };

  environment.variables = {
    XCURSOR_THEME = "Bibata-Modern-Classic";
    XCURSOR_SIZE = "24";
    HYPRCURSOR_THEME = "Bibata-Modern-Classic";
    HYPRCURSOR_SIZE = "24";
    QT_QPA_PLATFORMTHEME = "qt6ct";
  };

  fonts.packages = with pkgs; [
    fira-code
    fira-code-symbols
    fira-code-nerdfont
    nerd-font-patcher
    inter
  ];

  environment.sessionVariables = {
    NIXOS_OZONE_WL = "1";
    EDITOR = "kitty -e nvim";
    CHROME_EXECUTABLE = "chromium";
    FLUTTER_HOME = "${pkgs.flutter}";
  };

  # Some programs need SUID wrappers, can be configured further or are
  # started in user sessions.
  # programs.mtr.enable = true;
  # programs.gnupg.agent = {
  #   enable = true;
  #   enableSSHSupport = true;
  # };

  # List services that you want to enable:

  # Enable the OpenSSH daemon.
  # services.openssh.enable = true;

  # Open ports in the firewall.
  # networking.firewall.allowedTCPPorts = [ ... ];
  # networking.firewall.allowedUDPPorts = [ ... ];
  # Or disable the firewall altogether.
  # networking.firewall.enable = false;

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}
