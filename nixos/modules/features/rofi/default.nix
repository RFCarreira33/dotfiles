{ self, inputs, ... }: {
  perSystem = { pkgs, lib, self', ... }: {
    packages.rofi = inputs.wrapper-modules.lib.wrapPackage({...}: {
        inherit pkgs;
        package = pkgs.rofi;

        flags = {
          "-config" = ./config.rasi;
        };
      });
  };
}

