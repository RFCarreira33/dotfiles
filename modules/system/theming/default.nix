{ self, inputs, ... }: {
  flake.nixosModules.theming =
    {
      pkgs,
      lib,
      ...
    }:
    let
      modules = with self.nixosModules; [
        gtk
        stylix
      ];
    in
    {
      imports = modules;
    };
}
