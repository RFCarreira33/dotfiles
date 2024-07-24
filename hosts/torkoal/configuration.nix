{ inputs, lib, config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      inputs.home-manager.nixosModules.home-manager
    ];

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = 3;
      extraEntries."manjaro.conf" = ''
        title Manjaro
        efi   /efi/Manjaro/grubx64.efi
      '';
    };
  };

  users.defaultUserShell = pkgs.zsh;
  services.passSecretService.enable = true;
  services.resolved.enable = true;
  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 2d";
  };

  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  networking.hostName = "torkoal";

  time.timeZone = "Europe/Lisbon";

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


  services = {
    displayManager.sddm.enable = true;

    xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;

      xkb = {
        layout = "pt";
        variant = "";
        options = "ctrl:nocaps";
      };
      videoDrivers = [ "nvidia" ];
    };
  };

  hardware.nvidia = {
    modesetting.enable = true;
    powerManagement.enable = false;
    powerManagement.finegrained = false;
    open = false;
    nvidiaSettings = true;
    package = config.boot.kernelPackages.nvidiaPackages.stable;
  };

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    plasma-browser-integration
    konsole
    oxygen
  ];

  console.keyMap = "pt-latin1";
  programs = {
    firefox.enable = true;
    steam.enable = true;
    zsh = {
      enable = true;
      enableCompletion = true;
      syntaxHighlighting.enable = true;
      autosuggestions.enable = true;
      histSize = 10000;
      promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";

      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake .#";
        ls = "eza -l --git --icons=always --group-directories-first";
        c = "clear";
        cat = "bat";
        grep = "rg";
        dots = "cd ~/dotfiles && nvim";
        gc = "nix-collect-garbage -d";
      };

      ohMyZsh = {
        enable = true;
        plugins = [
          "git"
        ];
      };
    };
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  # Define a user account. Don't forget to set a password with ‘passwd’.
  users.users.rofis = {
    shell = pkgs.zsh;
    isNormalUser = true;
    description = "Rodrigo Carreira";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.rofis = import ../../modules/home.nix;
  };

  nixpkgs.config.allowUnfree = true;

  fonts.packages = with pkgs; [
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  environment.systemPackages = with pkgs; [
    discord
    git
    neovim
    google-chrome
    github-desktop
    alacritty
    hdparm
    spotify
    yarn
    nodejs
    stremio
    rustup
    gcc
    tmux
  ];

  system.stateVersion = "24.05";
}
