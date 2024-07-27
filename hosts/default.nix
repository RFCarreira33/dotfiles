{ lib, pkgs, ... }:
{
  stylix = with pkgs; {
    enable = true;
    base16Scheme = "${base16-schemes}/share/themes/gruvbox-dark-hard.yaml";
    polarity = "dark";
    fonts = lib.mkDefault {
      monospace = {
        package = nerdfonts.override { fonts = [ "Hack" ]; };
        name = "Hack Nerd Font Mono";
      };
      sansSerif = {
        package = dejavu_fonts;
        name = "DejaVu Sans";
      };
      serif = {
        package = dejavu_fonts;
        name = "DejaVu Serif";
      };
      emoji = {
        package = noto-fonts-color-emoji;
        name = "Noto Color Emoji";
      };
    };
    image = ../resources/wall.jpg;
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-color-emoji
    noto-fonts-cjk
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  #Locale
  time.timeZone = "Europe/Lisbon";
  console.keyMap = "pt-latin1";

  i18n = {
    defaultLocale = "en_US.UTF-8";
    extraLocaleSettings = {
      LC_ADDRESS = "pt_PT.UTF-8";
      LC_IDENTIFICATION = "pt_PT.UTF-8";
      LC_MEASUREMENT = "pt_PT.UTF-8";
      LC_MONETARY = "pt_PT.UTF-8";
      LC_NAME = "pt_PT.UTF-8";
      LC_NUMERIC = "pt_PT.UTF-8";
      LC_PAPER = "pt_PT.UTF-8";
      LC_TELEPHONE = "pt_PT.UTF-8";
      LC_TIME = "pt_PT.UTF-8";
    };
  };

  nixpkgs.config.allowUnfree = true;
  nix = {
    settings.experimental-features = [ "nix-command" "flakes" ];
    gc = {
      automatic = true;
      dates = "daily";
      options = "--delete-older-than 2d";
    };
  };

  # Packages and services
  services = {
    passSecretService.enable = true;
    resolved.enable = true;
  };

  programs = {
    firefox.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;
      histSize = 10000;
      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
      shellInit = "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh";

      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake $FLAKE.#";
        ls = "eza -l --git --icons=always --group-directories-first";
        c = "clear";
        cat = "bat";
        grep = "rg";
        dots = "cd ~/dotfiles && nvim";
        gc = "nix-collect-garbage -d";
        neofetch = "fastfetch";
      };
    };
  };

  environment = {
    shells = [ pkgs.zsh ];
    sessionVariables = {
      FLAKE = "/home/rofis/dotfiles/";
    };
    systemPackages = with pkgs; [
      discord
      git
      neovim
      github-desktop
      alacritty
      fastfetch
      fzf
      eza
      curl
      tmux
      zsh-powerlevel10k
      rustup
      gcc
      xclip
      wget
      yarn
      nodejs
      ripgrep
      lazygit
      bat
      btop
      flameshot
      fd
    ];
  };

  # User
  users = {
    defaultUserShell = pkgs.zsh;
    users.rofis = {
      isNormalUser = true;
      description = "Rodrigo Carreira";
      extraGroups = [ "networkmanager" "wheel" "audio" ];
    };
  };
}
