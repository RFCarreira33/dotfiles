{ inputs, lib, config, pkgs, ... }:
{
  options.i3.enable = lib.mkEnableOption "Enables i3 as WM and XFCE as DE";

  config = lib.mkIf config.i3.enable {
    services = {
      displayManager.defaultSession = "xfce+i3";

      xserver = {
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
  };
}
