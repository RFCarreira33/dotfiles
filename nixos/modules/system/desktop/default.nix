{self, inputs, ...}: {
  flake.nixosModules.desktop = {
    pkgs,
    lib,
    ...
  }: let 
    modules = with self.nixosModules; [
      core
      audio
      network
    ];

  in {
    imports = modules;

    services.printing.enable = true;

    programs.firefox.enable = true;

    environment.systemPackages = with pkgs; [
      discord
    ];
  };
}
