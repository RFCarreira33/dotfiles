{ pkgs, lib, inputs, config, ... }:
{
  imports = [
    inputs.spicetify-nix.homeManagerModules.default
  ];

  options.spotifyModule.enable = lib.mkEnableOption "Enables spicetify module";

  config = lib.mkIf config.spotifyModule.enable {
    nixpkgs.config.allowUnfreePredicate = pkg: builtins.elem (lib.getName pkg) [
      "spotify"
    ];

    programs.spicetify =
      let
        spicePkgs = inputs.spicetify-nix.legacyPackages.${pkgs.system};
      in
      {
        enable = true;
        enabledExtensions = with spicePkgs.extensions; [
          adblock
          shuffle
          hidePodcasts
        ];
        theme = spicePkgs.themes.onepunch;
        colorScheme = "dark";
      };
  };
}
