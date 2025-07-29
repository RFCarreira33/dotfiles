{ lib, config, ... }:
{
  imports = [
    ./i3.nix
    ./spotify.nix
  ];

  i3Module.enable = lib.mkDefault false;
  spotifyModule.enable = lib.mkDefault false;
}
