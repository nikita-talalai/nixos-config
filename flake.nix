{
  description = "NixOS configuration";

  inputs = {
    nixpkgs.url = "github:nixos/nixpkgs/nixos-23.11";
    nixpkgs-unstable.url = "github:nixos/nixpkgs/nixpkgs-unstable";

    home-manager.url = "github:nix-community/home-manager/release-23.11";
    home-manager.inputs.nixpkgs.follows = "nixpkgs";

    # stylix.url = "github:danth/stylix/release-23.11";
    nvim.url = "github:nikita-talalai/nvim-nix";
  };

  outputs = { self, nixpkgs, nixpkgs-unstable, home-manager, nvim, ... }@inputs:
    let
      inherit (self) outputs;
      systems = [ "x86_64-linux" ];
      forAllSystems = nixpkgs.lib.genAttrs systems;
    in {
      nixosConfigurations = {
        z270a = nixpkgs.lib.nixosSystem {
          specialArgs = { inherit inputs outputs; };
          modules = [ ./nixos ];
        };
      };

      homeConfigurations = {
        "nikita@z270a" = home-manager.lib.homeManagerConfiguration {
          pkgs = nixpkgs.legacyPackages.x86_64-linux;
          extraSpecialArgs = { inherit inputs outputs; };
          modules = [ ./home-manager ];
        };
      };
    };
}
