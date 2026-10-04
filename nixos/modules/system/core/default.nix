{self, inputs, ...}: {
  flake.nixosModules.core = {
    pkgs,
    lib,
    ...
  }: let 
    modules = with self.nixosModules; [
      user
      locale
      nix-settings
      zsh
    ];
  in {
    imports = [
      /etc/nixos/hardware-configuration.nix
    ] ++ modules;

    environment.systemPackages = with pkgs; [
      vim 
      wget
      git
      curlWithGnuTls
      usbutils
    ];

    system.stateVersion = "26.05";
  };
}
