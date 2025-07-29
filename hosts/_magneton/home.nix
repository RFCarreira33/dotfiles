{ ... }:
{
  imports = [
    ../../hm-modules/default.nix
  ];

  neovimModule.enableLsp = false;
  spotifyModule.enable = false;
  gammaModule.enable = false;
}
