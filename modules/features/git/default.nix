{
  inputs,
  moduleWithSystem,
  ...
}:
{
  flake.nixosModules.git = moduleWithSystem (
    {
      pkgs,
      self',
      lib,
      ...
    }:
    {
      programs = {
        git = {
          enable = true;
          package = self'.packages.git;
        };
        gnupg.agent = {
          enable = true;
          pinentryPackage = pkgs.pinentry-all;
        };
      };
    }
  );

  perSystem =
    {
      pkgs,
      lib,
      self',
      ...
    }:
    {
      packages.git = inputs.wrapper-modules.wrappers.git.wrap {
        inherit pkgs;

        settings = {
          user = {
            email = "rodrigocarreira33@gmail.com";
            name = "RFCarreira33";
          };
          credential.helper = "store";
        };
      };
    };
}
