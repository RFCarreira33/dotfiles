{self, inputs, ...}: {
  flake.nixosModules.user = {
    pkgs,
    lib,
    ...
  }: {
    users = {
      users."rofis" = {
        isNormalUser = true;
        initialPassword = "123";
        description = "Rodrigo Carreira";
        extraGroups = [ "networkmanager" "wheel" "audio" "video" "scanner" "lp" "root"];
      };
    };
  };
}
