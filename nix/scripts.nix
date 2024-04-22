{
  perSystem = {
    self',
    pkgs,
    ...
  }: 
  {
    mission-control.scripts = {
      nixos = {
        category = "Nix";
        description = "Build NixOS configuration";
        exec = pkgs.writeShellScriptBin "nixos" ''
          set -euo pipefail
          sudo nixos-rebuild switch --flake .#
        '';
      };
      home = {
        category = "Nix";
        description = "Build home-manager configuration";
        exec = pkgs.writeShellScriptBin "home" ''
          set -euo pipefail
          home-manager switch --flake .#nikita@z270a
        '';
      };
      update = {
        category = "Nix";
        description = "Update flake inputs";
        exec = pkgs.writeShellScriptBin "update" ''
          set -euo pipefail
          nix flake update
        '';
      };
      reload = {
        category = "direnv";
        description = "Reload direnv";
        exec = pkgs.writeShellScriptBin "reload" ''
          set -euo pipefail
          direnv reload
        '';
      };
    };
  };
}
