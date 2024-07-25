{ inputs, lib, config, pkgs, ... }:
{
  imports = [
    inputs.home-manager.nixosModules.home-manager
    ./hardware-configuration.nix
    ../default.nix
  ];

  boot.loader.systemd-boot.enable = true;
  boot.loader.efi.canTouchEfiVariables = true;

  networking.hostName = "murkrow"; # Define your hostname.

  networking.networkmanager.enable = true;

  services.libinput = {
    enable = true;
    touchpad.naturalScrolling = true;
  };

  # Configure keymap in X11
  services.xserver = {
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
    windowManager.i3.enable = true;
  };
  services.displayManager.defaultSession = "xfce+i3";

  hardware.pulseaudio.enable = false;
  security.rtkit.enable = true;
  services.pipewire = {
    enable = true;
    alsa.enable = true;
    alsa.support32Bit = true;
    pulse.enable = true;
  };

  services.undervolt = {
    enable = true;
    coreOffset = -90;
    gpuOffset = -60;
  };

  home-manager = {
    extraSpecialArgs = { inherit inputs; };
    users.rofis = import ../../modules/home.nix;
  };

  environment.systemPackages = with pkgs; [
    tlp
  ];

  system.stateVersion = "24.05";
}
