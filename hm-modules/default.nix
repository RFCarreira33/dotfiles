{ vars, ... }:
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

  services.gammastep = {
    enable = true;
    tray = false;
    latitude = 39.77;
    longitude = -8.79;
    duskTime = "18:00-20:00";
    dawnTime = "06:00-08:00";
    temperature = {
      day = 6500;
      night = 3100;
    };
  };

  home = {
    username = vars.username;
    homeDirectory = "/home/${vars.username}";
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
