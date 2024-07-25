{ inputs, lib, config, pkgs, ... }:
{
  programs.tmux = {
    enable = true;
    terminal = "xterm-256color";

    extraConfig = ''
      set -ag terminal-overrides ",xterm-256color:RGB"

      # Set split binds
      bind v split-window -h
      bind h split-window -v
      bind n new-window
      bind q kill-pane

      # unbind old split bind
      unbind '"'
      unbind %

      # maximazing pane
      bind -r m resize-pane -Z
      set -g mouse on
    '';

    plugins = with pkgs.tmuxPlugins; [
      vim-tmux-navigator
      sensible
      resurrect
      continuum
      gruvbox
      better-mouse-mode
    ];
  };
}
