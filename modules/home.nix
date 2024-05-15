{ inputs
, lib
, config
, pkgs
, ...
}: {
  imports = [
    # If you want to use home-manager modules from other flakes (such as nix-colors):
    # inputs.nix-colors.homeManagerModule
    ./neovim.nix
    ./alacritty.nix
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

  home.stateVersion = "23.11";
}
