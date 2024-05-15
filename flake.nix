{
  description = "Rofis Nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

    home-manager = {
      url = "github:nix-community/home-manager/release-23.11";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    spicetify-nix = {
      url = "github:the-argus/spicetify-nix";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    { self
    , nixpkgs
    , home-manager
    , ...
    } @ inputs:
    let
      system = "x86_64-linux";
      pkgs = import nixpkgs {
        inherit system;
        config.allowUnfree = true;
      };
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
      };
      homeConfigurations.rofis = home-manager.lib.homeManagerConfiguration {
        specialArgs = { inherit inputs; };
        modules = [ ./modules/home.nix ];
      };
    };
}
