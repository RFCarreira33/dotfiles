{ self, inputs, ... }: {
  flake.nixosModules.spotify = { pkgs, lib, ... }: {
    imports = [ 
      inputs.spicetify-nix.nixosModules.default
    ];

    programs.spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.stdenv.hostPlatform.system};
      in
      {
        enable = true;

        enabledExtensions = with spicePkgs.extensions; [
          adblock
          hidePodcasts
          shuffle
        ];

        theme = lib.mkForce spicePkgs.themes.onepunch;
        colorScheme = lib.mkForce "dark";
      };
  };
}
