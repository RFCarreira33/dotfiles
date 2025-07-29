{ lib, config, ... }:
{
  imports = [
    ./i3.nix
    ./kde5.nix
    ./stylix.nix
  ];

  stylixModule.enable = lib.mkDefault true;
  i3.enable = lib.mkDefault false;
  kde5.enable = lib.mkDefault false;
}
