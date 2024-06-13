

{ config, lib, pkgs, ... }: {

  # Flakes
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

}

