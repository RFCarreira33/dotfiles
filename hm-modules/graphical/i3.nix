{ inputs, lib, config, pkgs, ... }:
{
  options.i3Module.enable = lib.mkEnableOption "Enables i3 module";

  config = lib.mkIf config.i3Module.enable {
    xsession.windowManager.i3 = {
      enable = true;
      package = pkgs.i3-gaps;
      config = {
        defaultWorkspace = "1";
        terminal = "alacritty";
        menu = "rofi -show drun -i";
        modifier = "Mod1";
        gaps = {
          inner = 10;
          outer = -10;
        };
        bars = [
          {
            position = "top";
            statusCommand = "${pkgs.i3status-rust}/bin/i3status-rs ~/.config/i3status-rust/config-top.toml";
            fonts = lib.mkForce {
              names = [ "Hack" "FontAwesome5Free" ];
              size = 11.0;
            };
          }
        ];
        window.titlebar = false;
        keybindings =
          let
            modifier = config.xsession.windowManager.i3.config.modifier;
          in
          lib.mkOptionDefault {
            # shortcuts
            "${modifier}+q" = "kill";
            "${modifier}+b" = "exec firefox";
            "${modifier}+p" = "exec rofi -show power-menu -modi power-menu:rofi-power-menu";
            "${modifier}+Shift+f" = "exec rofi -show file-browser-extended";

            # vim like
            "${modifier}+l" = "focus right";
            "${modifier}+h" = "focus left";
            "${modifier}+j" = "focus down";
            "${modifier}+k" = "focus up";
            "${modifier}+Shift+l" = "move right";
            "${modifier}+Shift+h" = "move left";
            "${modifier}+Shift+j" = "move down";
            "${modifier}+Shift+k" = "move up";
          };
      };
    };

    programs.i3status-rust = {
      enable = true;
      bars = {
        top = {
          blocks = [
            {
              block = "cpu";
              info_cpu = 20;
              warning_cpu = 50;
              critical_cpu = 90;
            }
            {
              block = "memory";
              format = " $icon  $mem_used.eng(prefix:M, w:4) ";
            }
            {
              block = "temperature";
              format = " $icon $max ";
              interval = 10;
              chip = "*-isa-*";
            }
            {
              block = "battery";
              format = " $icon {$percentage $power.eng(w:4)} ";
              full_format = " $icon  Full ";
            }
            {
              block = "sound";
              click = [{
                button = "left";
                cmd = "pavucontrol";
              }];
            }
            {
              block = "time";
              interval = 60;
              format = " $timestamp.datetime(f:'%d/%m/%y %R') ";
            }
          ];
          icons = "awesome5";
          theme = "gruvbox-dark";
        };
      };
    };

    programs.rofi = {
      enable = true;
      terminal = "alacritty";
      plugins = with pkgs; [
        rofi-power-menu
        rofi-file-browser
      ];
    };

    xdg = {
      enable = true;
      configFile."rofi" = {
        source = ../../rofi/.config/rofi;
        recursive = true;
      };
    };
  };
}
