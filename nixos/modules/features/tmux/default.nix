{ self, inputs, ... }: {
  flake.nixosModules.tmux = { pkgs, lib, ... }: {
    programs.tmux = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.tmux;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.tmux = inputs.wrapper-modules.wrappers.tmux.wrap {
      inherit pkgs;

      baseIndex = 0;
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

