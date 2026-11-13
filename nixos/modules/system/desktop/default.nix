{self, inputs, ...}: {
  flake.nixosModules.desktop = {
    pkgs,
    lib,
    ...
  }: let 
    modules = with self.nixosModules; [
      core
      audio
      network
      nvim
      alacritty
      tmux
      sddm
    ];

  in {
    imports = modules;

    services.printing.enable = true;

    programs.firefox.enable = true;
    nixpkgs.config.allowUnfree = true;
    fonts.packages = [
      pkgs.nerd-fonts.hack
    ];

    environment.systemPackages = with pkgs; [
      discord
      stremio-linux-shell
      gammastep
    ];
  };
}
