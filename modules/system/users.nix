
{ config, lib, pkgs, ... }: {

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.pedrohbrasil = {
    isNormalUser = true;
    description = "Pedro H. Brasil";
    extraGroups = [ "networkmanager" "wheel"  "audio" ];
    shell = pkgs.zsh;
  };

}

