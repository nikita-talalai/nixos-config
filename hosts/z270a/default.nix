{ inputs, ... }:

{
  imports = [
    ./configuration.nix
    ./pkgs.nix
    "${inputs.self}/modules/xserver.nix"
    ./services
  ];
}
