{ self, ... }: {
  flake.nixosModules.murkrow =
    { config, pkgs, ... }:
    {
      imports = [
        self.nixosModules.desktop
        self.nixosModules.i3
      ];

      boot.loader.systemd-boot.enable = true;
      boot.loader.efi.canTouchEfiVariables = true;

      networking.hostName = "murkrow";

      hardware.graphics = {
        enable = true;
        extraPackages = with pkgs; [
          intel-media-driver
          intel-vaapi-driver
          libva-vdpau-driver
          libvdpau-va-gl
        ];
      };

    };
}
