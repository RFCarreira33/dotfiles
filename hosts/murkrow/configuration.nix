{ inputs, lib, config, pkgs, vars, ... }:
let
  backup_ext = "backup-" + pkgs.lib.readFile "${pkgs.runCommand "timestamp" {} "echo -n `date '+%Y%m%d%H%M%S'` > $out"}";
in
{
  imports = [
    ./hardware-configuration.nix
    ../default.nix
  ];

  programs.hyprland.enable = true;

  stylix.fonts.sizes = lib.mkDefault {
    terminal = 10;
    desktop = 14;
    applications = 14;
    popups = 12;
  };

  boot.loader = {
    efi.canTouchEfiVariables = true;
    systemd-boot = {
      enable = true;
      configurationLimit = 3;
    };
  };

  networking.hostName = "murkrow"; # Define your hostname.

  networking.networkmanager.enable = true;

  services = {
    xserver = {
      enable = true;
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
  };
  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio.enable = false;

  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  services = {
    undervolt = {
      enable = true;
      coreOffset = -90;
      gpuOffset = -60;
    };
    libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
    };
  };

  home-manager = {
    backupFileExtension = backup_ext;
    extraSpecialArgs = { inherit inputs vars; };
    users.${vars.username} = import ./home.nix;
  };

  environment.systemPackages = with pkgs; [
    tlp
    pavucontrol
    alsa-utils
    libsForQt5.dolphin
  ];

  system.stateVersion = "24.05";
}
