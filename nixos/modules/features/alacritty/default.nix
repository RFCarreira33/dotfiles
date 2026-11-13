{ self, inputs, ... }: {
  flake.nixosModules.alacritty = { pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.nerd-fonts.hack
      self.packages.${pkgs.stdenv.hostPlatform.system}.alacritty
    ];
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.alacritty = inputs.wrapper-modules.wrappers.alacritty.wrap {
      inherit pkgs;
        settings = (builtins.fromTOML (builtins.readFile ./alacritty.toml ));
      };
  };
}

