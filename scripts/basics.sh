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
  "npm"
  # langs
  "go"
  "rustup"
)

check_command () {
  command -v $1 >/dev/null 2>&1;
}

define_linux_package_manager () {
  check_command "pacman" && { echo "sudo pacman -S --noconfirm"; return; }
  check_command "apt" && { echo "sudo apt install -y"; return; }
  check_command "dnf" && { echo "sudo dnf install -y"; return; }
}

if [ "$OS" == "Darwin" ]; then
  echo "Checking Homebrew...";
  check_command "brew" || echo "Installing Homebrew..." && /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  PACKAGE_MANAGER="brew install";
  PACKAGES+=("iterm2", "gnu-sed", "node");

elif [ "$OS" == "Linux" ]; then
  echo "Checking package manager...";
  PACKAGE_MANAGER=$(define_linux_package_manager);
  PACKAGES+=("alacritty", "nodejs", "ttf-hack-nerd");

else
  echo "Unsupported operating system.";
  exit 1
fi

echo "Installing packages..."
for package in "${PACKAGES[@]}"; do
  $PACKAGE_MANAGER $package
done

# omzsh stops script
source ./zsh.sh && source ./zsh.sh

# Specific OS commands
if [ "$OS" == "Darwin" ]; then
  check_command "cargo" || rustup-init -y
else
  check_command "cargo" || rustup default stable
fi

rm -f ~/.zshrc
cd .. && stow nvim alacritty home
