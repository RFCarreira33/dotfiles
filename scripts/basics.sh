#!/bin/bash

OS=$(uname -s)
PACKAGE_MANAGER=""
PACKAGES=(
  # apps
  "neovim"
  "discord"
  "spotify"
  "neofetch"
  "lazygit"
  "neofetch"
  "tmux"
  # shell
  "stow"
  "eza"
  "ripgrep"
  "zsh"
  "fzf"
  "bat"
  "fd"
  "unzip"
  "curl"
  "gnu-sed"
  # langs
  "node"
  "go"
  "rustup"
)

check_command () {
  command -v $1 >/dev/null 2>&1;
}

define_linux_package_manager () {
  check_command "pacman" && return "pacman -S --no-confirm"
  check_command "apt" && return "apt install -y"
  check_command "dnf" && return "dnf install -y"
}

if [ "$OS" == "Darwin" ]; then
  echo "Checking Homebrew..."
  check_command "brew" || echo "Installing Homebrew..." && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  PACKAGE_MANAGER="brew install"
  packages+=("iterm2")

elif [ "$OS" == "Linux" ]; then
  echo "Checking package manager..."
  PACKAGE_MANAGER=$(define_linux_package_manager)
  packages+=("alacritty")

else
  echo "Unsupported operating system."
  exit 1
fi

echo "Installing packages..."
for package in "${packages[@]}"; do
  $PACKAGE_MANAGER $package
done

./zsh.sh

# Specific OS commands
if [ "$OS" == "Darwin" ]; then
  rustup-init -y
else
  rustup default stable
fi
