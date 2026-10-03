{self, inputs, ...}: {
	flake.nixosConfigurations.torkoal = inputs.nixpkgs.lib.nixosSystem {
		modules = [ self.nixosModules.torkoal ];
	};
}
