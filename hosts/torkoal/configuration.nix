{ inputs, lib, config, pkgs, vars, ... }:
let
  backup_ext = "backup-" + pkgs.lib.readFile "${pkgs.runCommand "timestamp" {} "echo -n `date '+%Y%m%d%H%M%S'` > $out"}";
in
{
  imports = [
    ./hardware-configuration.nix
    ../default.nix
    ../../modules/default.nix
  ];

  kde5.enable = true;

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
    xserver = {
      deviceSection = ''
        Option "Coolbits" "31"
      '';

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

  environment.systemPackages = with pkgs; [
    hdparm
    stremio
    gparted
    gwe
    libreoffice-qt
    gpu-screen-recorder-gtk
  ];

  programs = {
    steam.enable = true;
  };

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    pulse.enable = true;
  };

  home-manager = {
    backupFileExtension = backup_ext;
    extraSpecialArgs = { inherit inputs vars; };
    users.${vars.username} = import ./home.nix;
  };

  system.stateVersion = "24.05";
}
