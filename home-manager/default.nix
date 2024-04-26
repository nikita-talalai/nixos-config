{inputs, pkgs, pkgs-unstable, ...}:
{
  flake.homeConfigurations = {
    "nikita@z270a" = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {
        inherit inputs;
        inherit pkgs-unstable;
      };
      modules = [./home.nix];
    };
  };
}
