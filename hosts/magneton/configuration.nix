{ inputs, lib, config, pkgs, vars, ... }:
let
  backup_ext = "backup-" + pkgs.lib.readFile "${pkgs.runCommand "timestamp" {} "echo -n `date '+%Y%m%d%H%M%S'` > $out"}";
in
{
  imports = [
    ../../modules/stylix.nix
  ];

  networking.hostName = "magneton";
  services.nix-daemon.enable = true;
  security.pam.enableSudoTouchIdAuth = true;
  nix.settings.experimental-features = "nix-command flakes";

  stylixModule.enable = true;
  stylix.fonts.sizes = lib.mkDefault {
    terminal = 12;
    desktop = 12;
    applications = 10;
    popups = 12;
  };

  programs.zsh = {
    enable = true;
    enableCompletion = true;
    enableSyntaxHighlighting = true;
    promptInit = "source ${pkgs.zsh-powerlevel10k}/share/zsh-powerlevel10k/powerlevel10k.zsh-theme";
    loginShellInit = "[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh";
  };

  nixpkgs = {
    hostPlatform = "aarch64-darwin";
    config.allowUnfree = true;
  };

  system = {
    keyboard = {
      enableKeyMapping = true;
      remapCapsLockToControl = true;
    };
    defaults = {
      trackpad = {
        Clicking = true;
        TrackpadRightClick = true;
      };
      screencapture.location = "~/Pictures/screenshots";
      finder = {
        AppleShowAllExtensions = true;
      };
    };
  };

  environment = {
    shells = [ pkgs.zsh ];
    shellAliases = {
        rebuild = "darwin-rebuild switch --flake $DOTFILES";
        ls = "eza -l --git --icons=always --group-directories-first";
        c = "clear";
        cat = "bat";
        grep = "rg";
        dots = "cd $DOTFILES && nvim";
        gc = "nix-collect-garbage -d";
        neofetch = "fastfetch";
    };

    variables.DOTFILES = "/Users/rofis/dotfiles/";
    systemPackages = with pkgs; [
      neovim
      fastfetch
      fzf
      eza
      curl
      tmux
      zsh-powerlevel10k
      gcc
      wget
      yarn
      nodejs
      ripgrep
      lazygit
      bat
      fd
      zip
      unzip
      unrar
      zsh-powerlevel10k
      gcc
    ];
  };

  homebrew = {
    enable = true;
    casks = [
      "google-chrome"
      "alacritty"
      "discord"
      "spotify"
    ];
    brews = [
      "rustup"
    ];
  };

  users.users.${vars.username}.home = lib.mkForce "/Users/rofis";
  home-manager = {
    backupFileExtension = backup_ext;
    extraSpecialArgs = { inherit inputs vars; };
    users.${vars.username} = import ./home.nix;
  };

  system.stateVersion = 4;
}
