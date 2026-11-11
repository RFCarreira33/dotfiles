{ self, inputs, ... }: {
  flake.nixosModules.alacritty = { pkgs, lib, ... }: {
    environment.systemPackages = [
      pkgs.nerd-fonts.hack
      self.packages.${pkgs.stdenv.hostPlatform.system}.ftAlacritty
    ];
  };

  perSystem = { pkgs, lib, self', ... }: {
    packages.ftAlacritty = inputs.wrapper-modules.wrappers.alacritty.wrap {
      inherit pkgs;
        settings = (builtins.fromTOML (builtins.readFile ./alacritty.toml ));
      };
  };
}

