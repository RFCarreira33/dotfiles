{ lib, config, pkgs, ... }:
{
  options.neovimModule.enable = lib.mkEnableOption "Enables neovim module";

  config = lib.mkIf config.neovimModule.enable {
    xdg = {
      enable = true;
      configFile."nvim" = {
        recursive = true;
        source = ../../nvim/.config/nvim;
      };
    };

    programs.neovim = {
      enable = true;
      defaultEditor = true;
      viAlias = true;
      vimAlias = true;
      vimdiffAlias = true;

      plugins = with pkgs.vimPlugins; [
        lazy-nvim
      ];
    };
  };
}
