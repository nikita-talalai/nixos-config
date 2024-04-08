{ inputs, ... }:

let
  pkgs = inputs.nixpkgs.legacyPackages.x86_64-linux;
in
{

  flake.homeConfigurations = {
    "nikita@z270a" = inputs.home-manager.lib.homeManagerConfiguration {
      inherit pkgs;
      extraSpecialArgs = {inherit inputs;};
      modules = [ ./home.nix ];
    };
  };
}
