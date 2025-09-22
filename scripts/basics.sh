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
  "alacritty"
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
  "htmlls"
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
  PACKAGES+=("gnu-sed", "node");

elif [ "$OS" == "Linux" ]; then
  echo "Checking package manager...";
  PACKAGE_MANAGER=$(define_linux_package_manager);
  PACKAGES+=("nodejs", "ttf-hack-nerd");

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
  sudo spctl --master-disable
  check_command "cargo" || rustup-init -y
else
  check_command "cargo" || rustup default stable
fi

rm -rf ~/.zshrc ~/.p10k.zsh ~/.tmux.conf ~/.config/nvim ~/.config/alacritty
cd .. && stow nvim alacritty home
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
