{ lib, ... }:
{
  imports = [
    ./alacritty.nix
    ./neovim.nix
    ./tmux.nix
    ./gammastep.nix
  ];

  alacrittyModule.enable = lib.mkDefault true;
  neovimModule = {
    enable = lib.mkDefault true;
    enableLsp = lib.mkDefault true;
  };
  tmuxModule.enable = lib.mkDefault true;
  gammaModule.enable = lib.mkDefault true;
}
