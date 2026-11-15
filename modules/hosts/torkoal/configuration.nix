{ self, ... }: {
  flake.nixosModules.torkoal =
    { pkgs, lib, ... }:
    {
      imports = [
        self.nixosModules.desktop
        self.nixosModules.kde
      ];

      boot.loader.grub.enable = true;
      boot.loader.grub.device = "/dev/sda";
      boot.loader.grub.useOSProber = true;

      networking.hostName = "torkoal"; 
    };

}
