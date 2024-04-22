{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    flake-parts.url = "github:hercules-ci/flake-parts";
    # stylix.url = "github:danth/stylix/release-23.11";
    nvim.url = "github:nikita-talalai/nvim-nix";

    treefmt-nix.url = "github:numtide/treefmt-nix";
    xmonad.url = "github:nikita-talalai/xmonad-nix";
    xmobar.url = "github:nikita-talalai/xmobar-nix";

    flake-root.url = "github:srid/flake-root";
    mission-control.url = "github:Platonic-Systems/mission-control";
  };

  outputs = inputs:
    inputs.flake-parts.lib.mkFlake {inherit inputs;} {
      imports = [
        ./hosts
        ./home-manager
        ./nix
        inputs.treefmt-nix.flakeModule
        inputs.flake-root.flakeModule
        inputs.mission-control.flakeModule
      ];

      systems = ["x86_64-linux"];
      perSystem = {
        config,
        pkgs,
        system,
        ...
      }: {
        treefmt.config = {
          projectRootFile = "flake.nix";
          programs.alejandra.enable = true;
        };
        formatter = config.treefmt.build.wrapper;

        devShells.default = pkgs.mkShell {
          inputsFrom = [
            config.treefmt.build.devShell
            config.mission-control.devShell
          ];
          packages = with pkgs; [
            nil
          ];
        };
      };
    };
}
