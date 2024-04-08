{ inputs, ... }:

{
  flake.nixosConfigurations = {
    z270a = inputs.nixpkgs.lib.nixosSystem {
      specialArgs = { inherit inputs; };
      modules = [ ./z270a ];
    };
  };
}
