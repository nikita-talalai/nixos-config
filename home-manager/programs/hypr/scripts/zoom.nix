{pkgs, ...}: let
  zoom = pkgs.writeShellScriptBin "zoom" ''

    input=$(hyprctl getoption misc:cursor_zoom_factor | head -n1)

    value=''${input:7}

    result=$(echo "$value$1" | ${pkgs.bc}/bin/bc)

    hyprctl keyword misc:cursor_zoom_factor $result 1> /dev/null
  '';
in {home.packages = [zoom];}
