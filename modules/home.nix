{ inputs, lib, config, pkgs, ... }:
{
  imports = [
    ./neovim.nix
    ./alacritty.nix
    ./spotify.nix
    ./tmux.nix
    #./i3.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  programs = {
    home-manager = {
      enable = true;
    };
    git = {
      enable = true;
      userName = "RFCarreira33";
      userEmail = "rodrigocarreira33@gmail.com";
    };
  };

  home = {
    username = "rofis";
    homeDirectory = "/home/rofis";
    file = {
      ".p10k.zsh" = {
        source = ../home/.p10k.zsh;
        executable = true;
      };
      ".ideavimrc" = {
        source = ../home/.ideavimrc;
        executable = true;
      };
    };
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
