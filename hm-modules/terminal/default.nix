{ lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./neovim.nix
    ./tmux.nix
  ];

  alacrittyModule.enable = lib.mkDefault true;
  neovimModule.enable = lib.mkDefault true;
  tmuxModule.enable = lib.mkDefault true;
}
