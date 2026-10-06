{ self, inputs, moduleWithSystem, ... }: {
  flake.nixosModules.zsh = moduleWithSystem({ pkgs, self', lib, ... }: {
    programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableBashCompletion = true;
      autosuggestions.enable = true;
      syntaxHighlighting.enable = true;
      histSize = 10000;

      package = self.packages.${pkgs.stdenv.hostPlatform.system}.ftZsh;
    };
    users.defaultUserShell = self'.packages.ftZsh;
  });

  perSystem = { pkgs, lib, self', ... }: {
    packages = {
        ftZsh = inputs.wrapper-modules.wrappers.zsh.wrap {
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
          vim = lib.getExe self'.packages.ftNvim;
          vi = lib.getExe self'.packages.ftNvim;
          dots="cd ~/dotfiles && ${lib.getExe self'.packages.ftNvim}";
          vimrc="${lib.getExe self'.packages.ftNvim} ~/dotfiles/nvim/.config/nvim";
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

