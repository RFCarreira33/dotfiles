{ lib, pkgs, ... }:
{
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
    xserver = {
      enable = true;
      xkb = {
        variant = "";
        layout = "pt";
        options = "ctrl:nocaps";
      };
    };
  };

  programs = {
    firefox.enable = true;
    zsh.enable = true;
  };

  environment = {
    shells = [ pkgs.zsh ];
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
      htop
      flameshot
      fd
      s-tui
      stress
      zip
      rar
      unzip
      unrar
      python3
      geckodriver
      man-pages 
      man-pages-posix
    ];
  };
  documentation.dev.enable = true;

  # User
  users = {
    defaultUserShell = pkgs.zsh;
    users.rofis = {
      isNormalUser = true;
      description = "Rodrigo Carreira";
      extraGroups = [ "networkmanager" "wheel" "audio" "video" ];
    };
  };
}
