{pkgs, ...}: let
  fzf-windows = pkgs.writeShellScriptBin "fzf-windows" ''

  selected=$(
      find "$PERSONAL" -mindepth 1 -maxdepth 3 -type d |
      while read -r p; do echo "''${p##/home/nikita/}"; done |
      fzf
      )
  cd /home/nikita/"$selected"
  tmux new-window -n "$selected" -S

  '';
in {home.packages = [fzf-windows];}
