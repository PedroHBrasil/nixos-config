
{ config, lib, pkgs, ... }: {

  # Allow unfree packages
  nixpkgs.config.allowUnfree = true;

  # List packages installed in system profile. To search, run:
  # $ nix search wget
  environment.systemPackages = with pkgs; [
    # neovim # Do not forget to add an editor to edit configuration.nix! The Nano editor is also installed by default.
    wget
    wl-clipboard
    pavucontrol
    # nil
    # waybar
    # mako
    # libnotify
    # swww
    # wofi
  ];

}

