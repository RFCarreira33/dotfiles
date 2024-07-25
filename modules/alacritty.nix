{ inputs, lib, config, pkgs, ... }:
{
  programs.alacritty = {
    enable = true;
    settings = {
      env.TERM = "xterm-256color";

      font.size = 12;
      window = {
        padding = {
          x = 2;
          y = 2;
        };
        opacity = 0.9;
      };
      keyboard.bindings = [
        { key = "C"; mods = "Alt"; action = "Copy"; }
        { key = "V"; mods = "Alt"; action = "Paste"; }
      ];
    };
  };
}
