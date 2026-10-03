{self, inputs, ...}: {
	flake.nixosConfigurations.murkrow = inputs.nixpkgs.lib.nixosSystem {
		modules = [ self.nixosModules.murkrow ];
	};
}
