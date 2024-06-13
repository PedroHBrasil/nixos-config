
{ pkgs, ... }: {

  # Enable the X11 windowing system.
  services.xserver.enable = true;

  console = {
    enable = true;
    earlySetup = true;
    font = "${pkgs.terminus_font}/share/consolefonts/ter-132n.psf.gz";
    packages = [ pkgs.terminus_font ];
    # keyMap = "us";
    useXkbConfig = true;
  };

  services.greetd = {
    enable = true;
    settings = {
      default_session = {
        command = "${pkgs.greetd.tuigreet}/bin/tuigreet --time --remember --cmd Hyprland";
        user = "greeter";
      };
    };
  };

  programs.hyprland.enable = true;

  environment.systemPackages = with pkgs; [
    hyprpaper
    hyprcursor
    hyprpicker
    hyprshade
    hyprlock
    hyprshot
    hyprdim
    wofi
    waybar
    bibata-cursors
  ];
  # xdg.portal = {
  #   enable = true;
  #   configPackages = [ pkgs.xdg-desktop-portal-gtk ];
  #   extraPortals = [ pkgs.xdg-desktop-portal-gtk ];
  # };

  # security.pam.services.swaylock = {};
  #

  environment.variables.XCURSOR_THEME = "Bibata-Modern-Classic";
  environment.variables.XCURSOR_SIZE = "24";
  environment.variables.HYPRCURSOR_THEME = "Bibata-Modern-Classic";
  environment.variables.HYPRCURSOR_SIZE = "24";
}

