{ inputs, lib, config, pkgs, username, ... }:
let
  backup_ext = "backup-" + pkgs.lib.readFile "${pkgs.runCommand "timestamp" {} "echo -n `date '+%Y%m%d%H%M%S'` > $out"}";
in
{
  imports =
    [
      ./hardware-configuration.nix
      ../default.nix
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

  stylix.fonts.sizes = {
    terminal = 12;
    desktop = 10;
    applications = 10;
    popups = 10;
  };

  networking.hostName = "torkoal";

  services = {
    displayManager.sddm.enable = true;

    xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;
      deviceSection = ''
      Option "Coolbits" "31"
      '';

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

  environment = {
    plasma5.excludePackages = with pkgs.libsForQt5; [
      plasma-browser-integration
      konsole
      oxygen
      spectacle
      elisa
      okular
      ark
    ];
    systemPackages = with pkgs; [
      google-chrome
      hdparm
      stremio
      gparted
      libsForQt5.plasma-pa
      gwe
      libreoffice-qt
      gpu-screen-recorder-gtk
    ];
  };

  programs = {
    steam.enable = true;
  };

  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio = {
    enable = true;
    extraConfig = "load-module module-combine-sink";
  };

  home-manager = {
    backupFileExtension = backup_ext;
    extraSpecialArgs = { inherit inputs username; };
    users.${username} = import ./home.nix;
  };

  system.stateVersion = "24.05";
}
