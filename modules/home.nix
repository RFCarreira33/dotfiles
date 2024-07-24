{ inputs, lib, config, pkgs, ... }:
{
  imports = [
    ./neovim.nix
    ./alacritty.nix
    ./spotify.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  home = {
    username = "rofis";
    homeDirectory = "/home/rofis";
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "RFCarreira33";
      userEmail = "rodrigocarreira33@gmail.com";
    };
  };

  systemd.user.startServices = "sd-switch";

  home.stateVersion = "24.05";
}
