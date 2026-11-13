{ self, inputs, ... }: {
  perSystem = { pkgs, self', ... }: {
    packages.i3status-rust = inputs.wrapper-modules.lib.wrapPackage ({ ... }: {
      inherit pkgs;
      package = pkgs.i3status-rust;

      addFlag = [
        ./config.toml
      ];
    });
  };
}
