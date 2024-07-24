{
  description = "Rofis Nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:Gerg-L/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , spicetify-nix
    , ...
    } @ inputs:
    let
      system = "x86_64-linux";
    in
    {
      nixosConfigurations = {
        murkrow = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system inputs; };
          modules = [
            ./hosts/murkrow/configuration.nix
            inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480s
          ];
        };

        torkoal = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit system inputs; };
          modules = [
            ./hosts/torkoal/configuration.nix
          ];
        };
      };

      homeConfigurations.rofis = home-manager.lib.homeManagerConfiguration {
        extraSpecialArgs = { inherit inputs; };
        modules = [ ./modules/home.nix ];
      };
    };
}
