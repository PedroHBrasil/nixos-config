
{ config, pkgs, ... }: {

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    extraPackages = with pkgs; [
      lua-language-server
      nil
      stylua
      gnumake
      unzip
      gcc
      ripgrep
      fd
      nodejs
    ];
  };

}

