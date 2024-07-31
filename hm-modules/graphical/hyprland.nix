{ inputs, lib, config, pkgs, ... }:
let
  startup = pkgs.pkgs.writeShellScriptBin "start" ''
    waybar &
    swww init &

    sleep 1

    swww img ${../../resources/wall.jpg} &
  '';
in
{
  options.hyprlandModule.enable = lib.mkEnableOption "Enables Hyprland module";

  config = lib.mkIf config.hyprlandModule.enable {
    xdg = {
      enable = true;
      configFile."rofi" = {
        source = ../../rofi/.config/rofi;
        recursive = true;
      };
    };

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      settings = {
        exec-once = ''${startup}/bin/start'';
        general = with config.lib.stylix.colors; lib.mkDefault {
          "col.active_border" = "rgba(${base09}ff) rgba(${base0E}ff) 60deg";
          "col.inactive_border" = "rgba(${base00}ff)";
        };
      };

      extraConfig = ''
        ${builtins.readFile
          ../../hyprland/.config/hypr/hyprland.conf
        }
      '';
    };

    home = {
      sessionVariables = {
        NIXOS_OZONE_WL = "1";
        LIBVA_DRIVER_NAME = "iHD";
      };
      packages = with pkgs; [
        dunst
        rofi-wayland
        wdisplays
        wl-clipboard
        wl-mirror
        waybar
      ];
    };
  };
}
