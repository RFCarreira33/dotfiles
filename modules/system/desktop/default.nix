{ self, ... }: {
  flake.nixosModules.desktop =
    {
      pkgs,
      lib,
      ...
    }:
    let
      modules = with self.nixosModules; [
        core
        audio
        network
        nvim
        alacritty
        tmux
        sddm
        theming
      ];

    in
    {
      imports = modules;

      services.printing.enable = true;

      programs = {
        firefox.enable = true;
        steam.enable = true;
      };

      environment.systemPackages = with pkgs; [
        discord
        stremio-linux-shell
        github-desktop
        gammastep
      ];
    };
}
