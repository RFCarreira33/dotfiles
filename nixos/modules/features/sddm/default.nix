{ self, inputs, ... }: {
  flake.nixosModules.sddm = { pkgs, lib, ... }: {
    environment.systemPackages = with pkgs; [ sddm-astronaut ];
    services.displayManager.sddm = {
      enable = true;
      theme = "sddm-astronaut-theme";
      extraPackages = [pkgs.sddm-astronaut ];
    };
  };
}

