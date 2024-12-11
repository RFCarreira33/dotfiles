{ lib, config, pkgs, ... }:
{
  options.neovimModule = {
    enable = lib.mkEnableOption "Enables neovim module";
    enableLsp = lib.mkEnableOption "Install Lsp servers via nix packages";
  };

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

      extraPackages = with pkgs; lib.mkIf config.neovimModule.enableLsp [
        clang-tools
        lua-language-server
        pyright
        write-good
        typescript
        nixfmt-rfc-style
        nil
        rust-analyzer
        rustfmt
        texlab
      ];
    };
  };
}
