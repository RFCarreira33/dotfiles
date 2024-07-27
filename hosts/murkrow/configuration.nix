{ inputs, lib, config, pkgs, username, ... }:
let 
  backup_ext = "backup-" + pkgs.lib.readFile "${pkgs.runCommand "timestamp" {} "echo -n `date '+%Y%m%d%H%M%S'` > $out"}";
in
{
  imports = [
    ./hardware-configuration.nix
    ../default.nix
  ];

  stylix.fonts.sizes = {
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

  # Configure keymap in X11
  services = {
    displayManager.defaultSession = "xfce+i3";
    xserver = {
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
      windowManager.i3 = {
        enable = true;
        package = pkgs.i3-gaps;
        extraPackages = with pkgs; [
          rofi
          i3status-rust
        ];
      };
    };
  };

  nixpkgs.config.pulseaudio = true;
  hardware.pulseaudio = {
    enable = true;
    extraConfig = "load-module module-combine-sink";
  };

  security.rtkit.enable = true;

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
    extraSpecialArgs = { inherit inputs username; };
    users.${username} = import ./home.nix;
  };

  environment.systemPackages = with pkgs; [
    tlp
    pavucontrol
    alsa-utils
  ];

  system.stateVersion = "24.05";
}
