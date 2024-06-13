
{ config, lib, pkgs, ... }: {

  imports = [
    ./home/file.nix
    ./home/hyprland.nix
    ./home/packages.nix
    ./home/programs.nix
    ./home/session_variables.nix
  ];

  # Home Manager needs a bit of information about you and the paths it should
  # manage.
  home.username = "pedrohbrasil";
  home.homeDirectory = "/home/pedrohbrasil";

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  home.stateVersion = "24.05"; # Did you read the comment?

  # Let Home Manager install and manage itself.
  programs.home-manager.enable = true;

}

