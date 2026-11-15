{self, inputs, ...}: {
  flake.nixosModules.network = {
    pkgs,
    lib,
    ...
  }: {
    networking = {
      networkmanager.enable = true;
    };

    services.resolved.enable = true;
    networking.useDHCP = lib.mkDefault true;
  };
}
