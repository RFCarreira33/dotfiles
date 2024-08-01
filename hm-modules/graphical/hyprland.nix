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
      ];
    };

    wayland.windowManager.hyprland = {
      enable = true;
      xwayland.enable = true;

      extraConfig = ''
        ${builtins.readFile
          ../../hyprland/.config/hypr/hyprland.conf
        }
      '';

      settings = {
        exec-once = ''${startup}/bin/start'';
        general = with config.lib.stylix.colors; lib.mkForce {
          "col.active_border" = "rgba(${base09}ff)";
          "col.inactive_border" = "rgba(${base00}ff)";
        };
      };
    };

    programs.waybar = {
      enable = true;
      package = pkgs.waybar;

      settings = [
        {
          height = 5;
          layer = "top";
          modules-left = [ "hyprland/workspaces" ];
          modules-right = [
            "cpu"
            "temperature"
            "memory"
            "battery"
            "pulseaudio"
            "clock"
            "tray"
          ];
          battery = {
            format = " {capacity}% {power:4.2f} W {icon} ";
            format-alt = "{time}";
            format-icons = [ "" "" "" "" "" ];
            format-plugged = " {capacity}%  {power:4.2f} ";
            states = {
              critical = 10;
              warning = 20;
            };
          };
          clock = {
            format-alt = " {:%Y-%m-%d} ";
            tooltip-format = "{:%Y-%m-%d | %H:%M}";
          };
          cpu = {
            format = " {usage}% ";
            tooltip = false;
          };
          temperature = {
            format = " {temperatureC}°C  ";
            critical-threshold = 80;
          };
          memory = { format = " {used:0.2f}Gb  "; };
          pulseaudio = {
            format = "{volume}% {icon} ";
            format-muted = "";
            format-icons.default = [ "" "" "" ];
            on-click = "pavucontrol";
          };
        }
      ];

      style = with config.lib.stylix.colors; ''
        * {
        	font-size: 15px;
        	font-family: Hack;
        }

        window#waybar {
        	background: #${base00};
        	color: #${base07};
        }

        #custom-right-arrow-dark,
        #custom-left-arrow-dark {
        	color: #1a1a1a;
        }
        #custom-right-arrow-light,
        #custom-left-arrow-light {
        	color: #292b2e;
        	background: #1a1a1a;
        }

        #workspaces,
        #clock.1,
        #clock.2,
        #clock.3,
        #pulseaudio,
        #memory,
        #cpu,
        #battery,
        #disk,
        #tray {
        	background: #${base00};
        }

        #workspaces button {
        	padding: 0 2px;
        	color: #${base07};
        }

        #clock,
        #pulseaudio,
        #memory,
        #cpu,
        #battery {
        	padding: 0 10px;
        }
      '';
    };
  };
}
