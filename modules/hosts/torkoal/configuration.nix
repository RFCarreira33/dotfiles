{ self, ... }: {
  flake.nixosModules.torkoal =
    { pkgs, lib, ... }:
    {
      imports = [
        # Include the results of the hardware scan.
        self.nixosModules.desktop
        self.nixosModules.kde
      ];

      # Use the GRUB 2 boot loader.
      boot.loader.grub.enable = true;
      boot.loader.grub.device = "/dev/sda";
      boot.loader.grub.useOSProber = true;

      networking.hostName = "torkoal"; # Define your hostname.
    };

}
