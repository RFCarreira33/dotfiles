{
  description = "Rofis Nixos flake";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-24.05";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixos-unstable";

	nix-darwin = {
      url = "github:LnL7/nix-darwin";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    home-manager = {
      url = "github:nix-community/home-manager/release-24.05";
      inputs.nixpkgs.follows = "nixpkgs";
    };

    hyprland.url = "git+https://github.com/hyprwm/Hyprland?submodules=1";
    hyprland-plugins = {
      url = "github:hyprwm/hyprland-plugins";
      inputs.hyprland.follows = "hyprland";
    };
    stylix.url = "github:danth/stylix";
    spicetify-nix.url = "github:Gerg-L/spicetify-nix";
    nixos-hardware.url = "github:NixOS/nixos-hardware/master";
  };

  outputs =
    { self
    , nixpkgs
	, nix-darwin
    , home-manager
    , stylix
    , nixos-hardware
    , ...
    } @ inputs:
    let
      vars = {
        system = "x86_64-linux";
        username = "rofis";
      };
    in
    {
      darwinConfigurations.magneton = nix-darwin.lib.darwinSystem {
          specialArgs = { inherit inputs vars; };
          modules = [
            ./hosts/magneton/configuration.nix
            inputs.home-manager.darwinModules.home-manager
            inputs.stylix.darwinModules.stylix
          ];
        };

      nixosConfigurations = {
        murkrow = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit vars inputs; };
          modules = [
            ./hosts/murkrow/configuration.nix
            inputs.nixos-hardware.nixosModules.lenovo-thinkpad-t480s
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager
          ];
        };

        torkoal = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs vars; };
          modules = [
            ./hosts/torkoal/configuration.nix
            inputs.stylix.nixosModules.stylix
            inputs.home-manager.nixosModules.home-manager
          ];
        };
      };
    };
}
