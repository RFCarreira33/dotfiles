{ inputs
, lib
, config
, pkgs
, ...
}: {
  programs.alacritty = {
    enable = true;
    settings = {
      font.size = 9;
      window = {
        padding = {
          x = 2;
          y = 2;
        };
      };
      key_bindings = [
        { key = "C"; mods = "Alt"; action = "Copy"; }
        { key = "V"; mods = "Alt"; action = "Paste"; }
      ];
      xsession.windowManager.i3.config.terminal = "alacritty";
      home.sessionVariables.TERMINAL = "alacritty";
    };
  };
}
