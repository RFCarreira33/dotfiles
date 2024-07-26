{
  description = "Rofis Nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    stylix.url = "github:danth/stylix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , stylix
    , nixos-hardware
    , ...
    } @ inputs:
    let
      system = "x86_64-linux";
      username = "rofis";
    in
    {
      nixosConfigurations = {
        murkrow = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system inputs username; };
          modules = [
            ./hosts/murkrow/configuration.nix
            inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480s
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager
          ];
        };

        torkoal = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system inputs username; };
          modules = [
            ./hosts/torkoal/configuration.nix
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager
          ];
        };
      };
    };
}
