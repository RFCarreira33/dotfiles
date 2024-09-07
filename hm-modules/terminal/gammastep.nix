{ lib, config, pkgs, ... }:
{
  options.gammaModule.enable = lib.mkEnableOption "Enables gammastep module";

  config = lib.mkIf config.gammaModule.enable {
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
  };
}
