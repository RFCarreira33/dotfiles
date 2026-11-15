{ self, inputs, moduleWithSystem, ... }: {
  flake.nixosModules.zsh = moduleWithSystem({ pkgs, self', lib, ... }: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      histSize = 10000;

      package = self.packages.${pkgs.stdenv.hostPlatform.system}.zsh;
    };
    users.defaultUserShell = self'.packages.zsh;
  });

  perSystem = { pkgs, lib, self', ... }: {
    packages = {
        zsh = inputs.wrapper-modules.wrappers.zsh.wrap {
        inherit pkgs;
        runtimePkgs = [pkgs.devenv pkgs.fzf];
        zshrc.content = ''
          eval "$(${lib.getExe self'.packages.ohMyPosh} init zsh)"
        '';

        zshAliases = {
          ls = "${lib.getExe pkgs.eza} -l --git --icons=always --group-directories-first";
          c = "clear";
          cat = lib.getExe pkgs.bat;
          grep = lib.getExe pkgs.ripgrep;
          vim = lib.getExe self'.packages.nvim;
          vi = lib.getExe self'.packages.nvim;
          dots="cd ~/dotfiles && ${lib.getExe self'.packages.nvim}";
          vimrc="${lib.getExe self'.packages.nvim} ~/dotfiles/nvim/.config/nvim";
          rebuild = "sudo nixos-rebuild switch --impure --flake .";
        };
      };
      ohMyPosh = inputs.wrapper-modules.wrappers.oh-my-posh.wrap {
        inherit pkgs;
        configFile = ./config.omp.json;
      };
    };
  };
}

