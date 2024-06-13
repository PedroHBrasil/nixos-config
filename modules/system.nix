
{ config, lib, pkgs, ... }: {

  imports = [
    ./system/gui.nix
    ./system/boot.nix
    ./system/fonts.nix
    ./system/sound.nix
    ./system/users.nix
    ./system/nvidia.nix
    ./system/opengl.nix
    ./system/keyboard.nix
    ./system/printing.nix
    ./system/touchpad.nix
    ./system/bluetooth.nix
    ./system/networking.nix
    ./system/internationalisation.nix
    ./system/garbage_collection.nix
    ./system/experimental.nix
    ./system/packages.nix
    ./system/programs.nix
    ./system/hardware-configuration.nix
  ];

  # This value determines the NixOS release from which the default
  # settings for stateful data, like file locations and database versions
  # on your system were taken. It‘s perfectly fine and recommended to leave
  # this value at the release version of the first install of this system.
  # Before changing this value read the documentation for this option
  # (e.g. man configuration.nix or on https://nixos.org/nixos/options.html).
  system.stateVersion = "24.05"; # Did you read the comment?

}

