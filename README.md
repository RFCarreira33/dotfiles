## General Software

>- Text editor: Neovim
>- ColorScheme: Gruvbox
>- Terminal emulator: Alacritty
>- Shell: zsh with oh-my-zsh

## Installation

```bash
nix-shell -p git vim 

git clone https://github.com/rfcarreira/dotfiles

nixos-generate-config --show-hardware-config > hosts/<hostname>/hardware.nix

NIX_CONFIG="experimental-features = nix-command flakes" 

sudo nixos-rebuild switch --flake .#<hostname>
```
