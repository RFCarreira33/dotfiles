## General Software

>- Text editor: Neovim
>- ColorScheme: Gruvbox
>- Terminal emulator: Alacritty
>- Shell: zsh with oh-my-posh

## Installation

```bash
nix-shell -p git vim 

git clone https://github.com/rfcarreira/dotfiles

NIX_CONFIG="experimental-features = nix-command flakes" 

sudo nixos-rebuild switch --impure --flake .#<hostname>
```
