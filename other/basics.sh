#!/bin/bash

# List of packages for basic use
packages=(
  "neovim"
  "alacritty"
  "stow"
  "exa"
  "discord"
  "firefox"
  "npm"
  "tmux"
  "ripgrep"
  "zsh"
)

# Check for package manager
# I only apt for wsl and pacman for arch
if command -v apt >/dev/null 2>&1; then
    sudo apt update
    sudo apt install "${packages[@]}"
elif command -v pacman >/dev/null 2>&1; then
    sudo pacman -Syyu
    sudo pacman -S "${packages[@]}"
else
    echo "Unable to determine the package manager on your Linux distribution."
    exit 1
fi


