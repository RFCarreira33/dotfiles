{self, inputs, ...}: {
  flake.nixosModules.nix-settings = {
    pkgs,
    lib,
    ...
  }: {
    nix = {
        settings.experimental-features = ["nix-command" "flakes"];
        gc = {
          automatic = true;
          dates = "daily";
          options = "--delete-older-than 5d";
        };
    };

    nixpkgs.config.allowUnfree = true;
  };
}
