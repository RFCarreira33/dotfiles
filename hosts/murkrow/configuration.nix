{ inputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "murkrow"; # Define your hostname.

  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };
   services.passSecretService.enable = true;

  networking.networkmanager.enable = true;
  services.resolved.enable = true;
  nix.settings.experimental-features = [ "nix-command" "flakes" ];

  time.timeZone = "Europe/Lisbon";
  i18n.defaultLocale = "en_US.UTF-8";

  i18n.extraLocaleSettings = {
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

  nix.gc = {
    automatic = true;
    dates = "daily";
    options = "--delete-older-than 2d";
  };

  # Configure keymap in X11
  services.xserver = {
    enable = true;
    xkb = {
    	variant = "";
        layout = "pt";
        options = "ctrl:nocaps";
    };

    desktopManager = {
      xterm.enable = false;
      xfce = {
        enable = true;
        noDesktop = true;
        enableXfwm = false;
      };
    };
    windowManager.i3.enable = true;
  };
  services.displayManager.defaultSession = "xfce+i3";

  services.openssh.enable = true;

  console.keyMap = "pt-latin1";

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.undervolt = {
    enable = true;
    coreOffset = -90;
    gpuOffset = -60;
  };

  users.defaultUserShell = pkgs.zsh;
  users.users.rofis = {
    isNormalUser = true;
    description = "Rodrigo Carreira";
    extraGroups = [ "networkmanager" "wheel" ];
  };

  fonts.packages = with pkgs; [
    noto-fonts
    noto-fonts-cjk
    noto-fonts-emoji
    (nerdfonts.override { fonts = [ "Hack" ]; })
  ];

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.rofis = import ../../modules/home.nix;
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

      shellAliases = {
        rebuild = "sudo nixos-rebuild switch --flake .#";
        ls = "eza -l --git --icons=always --group-directories-first";
        c = "clear";
        cat = "bat";
        grep = "rg";
        dots = "cd ~/dotfiles && nvim";
      };

      ohMyZsh = {
        enable = true;
        plugins = [
          "git"
        ];
        theme = "powerlevel10k";
      };
    };
  };

  nixpkgs.config.allowUnfree = true;

  environment.systemPackages = with pkgs; [
    neovim
    git
    alacritty
    tlp
    discord
    neofetch
    htop
    fzf
    eza
    curl
    tmux
    ripgrep
    lazygit
    zsh-powerlevel10k
    github-desktop
    yarn
    xclip
    bat
  ];

  system.stateVersion = "24.05";
}
