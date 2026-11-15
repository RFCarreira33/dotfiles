{ self, inputs, ... }: {
  flake.nixosModules.nvim = { pkgs, lib, ... }: {
    programs.neovim = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.nvim;
    };
    environment.systemPackages = with pkgs; [
      github-copilot-cli
    ];
  };

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.nvim = inputs.wrapper-modules.wrappers.neovim.wrap {
        inherit pkgs;
        specs.general = with pkgs.vimPlugins; [
          lazy-nvim
        ];

        runtimePkgs = with pkgs; [
          tree-sitter
          ripgrep
          gcc
          fzf
          lua-language-server
          vscode-langservers-extracted
          rust-analyzer
          prettierd
          write-good
          clang
          djlint
          black
          alejandra
          rustfmt
          python313Packages.python-lsp-server
          typescript-language-server
          tailwindcss-language-server
          stylua
          nixd
          cargo
          gnumake
          lua5_1
          imagemagick
          luarocks
          nixfmt-rs
          nil
        ];

        settings.config_directory = ./.;
      };
    };
}
