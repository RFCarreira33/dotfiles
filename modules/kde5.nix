{ inputs, lib, config, pkgs, ... }:
{
  options.kde5.enable = lib.mkEnableOption "Enables KDE 5 as DE WM module";

  config = lib.mkIf config.kde5.enable {
    services = {
      displayManager.sddm.enable = true;
      xserver.desktopManager.plasma5.enable = true;
    };

    # remove bloat
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
    };
  };
}
