
{ pkgs, hy3, ... }: {

  xdg.portal = {
    enable = true;
    extraPortals = [
      pkgs.xdg-desktop-portal-gtk
    ];
    configPackages = [
      pkgs.xdg-desktop-portal-gtk
    ];
  };

  gtk.enable = true;
  gtk.cursorTheme.package = pkgs.bibata-cursors;
  gtk.cursorTheme.name = "Bibata-Modern-Classic";

  gtk.theme.package = pkgs.adw-gtk3;
  gtk.theme.name = "adw-gtk3";

  qt.enable = true;
  qt.platformTheme.name = "gtk";

  # wayland.windowManager.hyprland = {
  #   enable = true;
  #   plugins = [ hy3.packages.x86_64-linux.hy3 ];
  #   settings = {
  #     "$mod" = "SUPER";
  #     monitor = [
  #       "eDP-1,3840x2160@60.00,0x0,1.5"
  #       "DP-3,3440x1440@174.96,2560x0,1.0"
  #     ];
  #
  #   };
  # };
}

