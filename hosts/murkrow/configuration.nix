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

  hyprland.enable = true;

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
      coreOffset = -80;
      gpuOffset = -50;
    };
    libinput = {
      enable = true;
      touchpad.naturalScrolling = true;
    };
    tlp = {
      enable = true;
      settings = {
        PLATFORM_PROFILE_ON_BAT = "balanced";
        CPU_ENERGY_PERF_POLICY_ON_BAT = "power";
        CPU_BOOST_ON_BAT = 1;
        CPU_SCALING_GOVERNOR_ON_BAT = "powersave";
        MEM_SLEEP_ON_BAT = "deep";

        PLATFORM_PROFILE_ON_AC = "performance";
        CPU_ENERGY_PERF_POLICY_ON_AC = "balance_performance";
        CPU_BOOST_ON_AC = 1;
        CPU_SCALING_GOVERNOR_ON_AC = "performance";

        WOL_DISABLE = "Y";
      };
    };
  };

  home-manager = {
    backupFileExtension = backup_ext;
    extraSpecialArgs = { inherit inputs vars; };
    users.${vars.username} = import ./home.nix;
  };

  environment.systemPackages = with pkgs; [
    pavucontrol
  ];

  system.stateVersion = "24.05";
}
