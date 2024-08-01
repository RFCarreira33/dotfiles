{ lib, config, ... }:
{
  imports = [
    ./i3.nix
    ./kde5.nix
    ./hyprland.nix
  ];

  i3.enable = lib.mkDefault false;
  kde5.enable = lib.mkDefault false;
  hyprland.enable = lib.mkDefault false;
}
