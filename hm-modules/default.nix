{ vars, lib, ... }:
{
  imports = [
    ./graphical/default.nix
    ./terminal/default.nix
  ];

  nixpkgs = {
    config = {
      allowUnfree = true;
      allowUnfreePredicate = _: true;
    };
  };

  programs = {
    home-manager.enable = true;
    git = {
      enable = true;
      userName = "RFCarreira33";
      userEmail = "rodrigocarreira33@gmail.com";
    };
  };

  home = {
    username = vars.username;
    homeDirectory = lib.mkDefault "/home/${vars.username}";
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
