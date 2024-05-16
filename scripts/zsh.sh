#!/bin/bash

if [ ! -d "$HOME/.oh-my-zsh" ]; then
    echo "Oh My Zsh is not installed. Installing Oh My Zsh..."
    sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)" 
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/themes/powerlevel10k" ]; then
    echo "Cloning Powerlevel10k..."
    git clone --depth=1 https://github.com/romkatv/powerlevel10k.git ${ZSH_CUSTOM:-$HOME/.oh-my-zsh/custom}/themes/powerlevel10k
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-autosuggestions" ]; then
    echo "Cloning Zsh Autosuggestions..."
    git clone https://github.com/zsh-users/zsh-autosuggestions ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-autosuggestions
fi

if [ ! -d "$HOME/.oh-my-zsh/custom/plugins/zsh-syntax-highlighting" ]; then
    echo "Cloning Zsh Syntax Highlighting..."
    git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
fi
