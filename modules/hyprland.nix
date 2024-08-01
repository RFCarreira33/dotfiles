{ inputs, lib, config, pkgs, ... }:
{
  options.hyprland.enable = lib.mkEnableOption "Enables Hyprland as WM";

  config = lib.mkIf config.hyprland.enable {
    programs.hyprland.enable = true;
    hardware.brillo.enable = true;

    environment = {
      systemPackages = with pkgs; [
        dunst
        rofi-wayland
        wdisplays
        wl-clipboard
        wl-mirror
      ];

      sessionVariables = {
        NIXOS_OZONE_WL = 1;
        LIBVA_DRIVER_NAME = "iHD";
      };
    };

    services.xserver = {
      displayManager.gdm = {
        enable = true;
        wayland = true;
      };
    };
  };
}
