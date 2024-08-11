{ lib, config, ... }:
{
  imports = [
    ./i3.nix
    ./spotify.nix
    ./hyprland.nix
    ./chrome.nix
  ];

  i3Module.enable = lib.mkDefault false;
  spotifyModule.enable = lib.mkDefault false;
  hyprlandModule.enable = lib.mkDefault false;
  chromeModule.enable = lib.mkDefault false;
}
