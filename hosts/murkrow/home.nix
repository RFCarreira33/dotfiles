{ lib, ... }:
{
  imports = [
    ../../hm-modules/default.nix
  ];

  spotifyModule.enable = false;
  i3Module.enable = true;
}
