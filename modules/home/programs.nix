
{ config, pkgs, ... }: {

  imports = [
    ./programs/neovim.nix
  ];

  programs.git = {
    enable = true;
    userName = "Pedro H. Brasil";
    userEmail = "pedrohbrasil.pro@pm.me";
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    shellAliases = {
      ll = "ls -l";
      update_system = "sudo nixos-rebuild switch --flake .";
      update_home = "home-manager switch --flake .";
    };

    initExtra = "bindkey \"''\${key[Up]}\" up-line-or-search''";
  };

  programs.starship = {
    enable = true;
  };

  programs.alacritty = {
    enable = true;
    settings = {
      shell = "zsh";
      font.size = 16.0;
      font.normal = {
        family = "FiraCode Nerd Font";
        style = "Regular";
      };
    };
  };

  # programs.tmux = {
  #   enable = true;
  #   clock24 = true;
  #   resizeAmount = 5;
  #   keyMode = "vi";
  #   newSession = true;
  #   baseIndex = 1;
  #   escapeTime = 0;
  #   plugins = with pkgs; [
  #     tmuxPlugins.yank
  #   ];
  #   extraConfig = ''
  #     # Color fix
  #     set -as terminal-features ",alacritty*:RGB"
  #
  #     # Clipboard setup
  #     set -s set-clipboard on
  #
  #     # Vim compatible copy mode
  #     bind-key -T copy-mode-vi v send-keys -X begin-selection
  #     bind-key -T copy-mode-vi C-v send-keys -X rectangle-togle
  #     bind-key -T copy-mode-vi y send-keys -X copy-selection-channel
  #
  #     # Smart pane switching with awareness of Vim splits.
  #     # See: https://github.com/christoomey/vim-tmux-navigator
  #     is_vim="ps -o state= -o comm= -t '#{pane_tty}' \
  #         | grep -iqE '^[^TXZ ]+ +(\\S+\\/)?g?(view|l?n?vim?x?|fzf)(diff)?$'"
  #     bind-key -n 'C-h' if-shell "$is_vim" 'send-keys C-h'  'select-pane -L'
  #     bind-key -n 'C-j' if-shell "$is_vim" 'send-keys C-j'  'select-pane -D'
  #     bind-key -n 'C-k' if-shell "$is_vim" 'send-keys C-k'  'select-pane -U'
  #     bind-key -n 'C-l' if-shell "$is_vim" 'send-keys C-l'  'select-pane -R'
  #     tmux_version='$(tmux -V | sed -En "s/^tmux ([0-9]+(.[0-9]+)?).*/\1/p")'
  #     if-shell -b '[ "$(echo "$tmux_version < 3.0" | bc)" = 1 ]' \
  #         "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\'  'select-pane -l'"
  #     if-shell -b '[ "$(echo "$tmux_version >= 3.0" | bc)" = 1 ]' \
  #         "bind-key -n 'C-\\' if-shell \"$is_vim\" 'send-keys C-\\\\'  'select-pane -l'"
  #
  #     bind-key -T copy-mode-vi 'C-h' select-pane -L
  #     bind-key -T copy-mode-vi 'C-j' select-pane -D
  #     bind-key -T copy-mode-vi 'C-k' select-pane -U
  #     bind-key -T copy-mode-vi 'C-l' select-pane -R
  #     bind-key -T copy-mode-vi 'C-\' select-pane -l
  #   '';
  # };

}

