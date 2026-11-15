{ self, inputs, ... }: {
  perSystem = { pkgs, lib, self', ... }: {
    packages.rofi = inputs.wrapper-modules.lib.wrapPackage({...}: {
        inherit pkgs;
        package = pkgs.rofi;

        runtimePkgs = with pkgs; [
          rofi-power-menu
          rofi-file-browser
        ];

        flags = {
          "-config" = ./config.rasi;
        };
      });
  };
}

