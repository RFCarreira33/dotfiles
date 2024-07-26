{ inputs, lib, config, pkgs, ... }:
{
  xdg = {
    enable = true;
    configFile."nvim" = {
      recursive = true;
      source = ../nvim/.config/nvim;
    };
  };

  programs.neovim = {
    enable = true;
    defaultEditor = true;
    viAlias = true;
    vimAlias = true;
    vimdiffAlias = true;

    plugins = with pkgs.vimPlugins; [
      lazy-nvim
    ];
  };
}
