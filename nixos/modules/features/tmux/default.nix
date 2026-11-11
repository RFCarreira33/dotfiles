{ self, inputs, ... }: {
  flake.nixosModules.tmux = { pkgs, lib, ... }: {
    programs.tmux = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.ftTmux;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.ftTmux = inputs.wrapper-modules.wrappers.tmux.wrap {
      inherit pkgs;

      configBefore = 
        let 
          lines = lib.splitString "\n" (builtins.readFile ./.tmux.conf);
        in
          builtins.concatStringsSep "\n" (lib.take 17 lines);

      plugins = with pkgs.tmuxPlugins; [
        vim-tmux-navigator
        sensible
        resurrect
        continuum
        gruvbox
        better-mouse-mode
      ];
    };
  };
}

