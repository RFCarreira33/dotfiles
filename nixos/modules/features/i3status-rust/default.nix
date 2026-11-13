{ self, inputs, moduleWithSystem, ... }: {
  flake.nixosModules.i3status-rust = moduleWithSystem({ pkgs, self', lib, ... }: {
  });

  perSystem = { pkgs, lib, self', ... }: {
    packages.i3status-rust = inputs.wrapper-modules.lib.wrapPackage({...}: {
        inherit pkgs;
        package = pkgs.i3status-rust;
        options = [
          ./config.toml
        ];
      });
  };
}

