{ inputs, lib, config, pkgs, ... }:
{
  options.alacrittyModule.enable = lib.mkEnableOption "Enables alacritty module";

  config = lib.mkIf config.alacrittyModule.enable {
    programs.alacritty = {
      enable = true;
      settings = {
        env.TERM = "xterm-256color";

        window = {
          padding = {
            x = 2;
            y = 2;
          };
          opacity = lib.mkForce 0.9;
        };
        keyboard.bindings = [
          { key = "C"; mods = "Alt"; action = "Copy"; }
          { key = "V"; mods = "Alt"; action = "Paste"; }
        ];
      };
    };
  };
}
