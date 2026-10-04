{ self, inputs, ... }: {
  flake.nixosModules.nvim = { pkgs, lib, ... }: {
    programs.neovim = {
      enable = true;
      package = self.packages.${pkgs.stdenv.hostPlatform.system}.ftNvim;
    };
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.ftNvim = inputs.wrapper-modules.wrappers.neovim.wrap {
      inherit pkgs;
      specs.general = with pkgs.vimPlugins; [
      	lazy-nvim
      ]; 

      settings.config_directory = ./nvim/.config/nvim/.;
    };
  };
}

