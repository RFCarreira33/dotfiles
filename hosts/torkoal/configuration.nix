{ inputs, lib, config, pkgs, ... }:
{
  imports =
    [
      ./hardware-configuration.nix
      ../default.nix
      inputs.home-manager.nixosModules.home-manager
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

  networking.hostName = "torkoal";

  services = {
    displayManager.sddm.enable = true;

    xserver = {
      enable = true;
      desktopManager.plasma5.enable = true;

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

  environment.plasma5.excludePackages = with pkgs.libsForQt5; [
    plasma-browser-integration
    konsole
    oxygen
  ];

  programs = {
    steam.enable = true;
    tuxclocker = {
      enable = true;
      useUnfree = true;
      enabledNVIDIADevices = [ 1 1 1 1 ];
    };
  };

  # Enable sound with pipewire.
  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.rofis = import ../../modules/home.nix;
  };

  environment.systemPackages = with pkgs; [
    google-chrome
    hdparm
    stremio
    gwe
    gparted
  ];

  system.stateVersion = "24.05";
}
