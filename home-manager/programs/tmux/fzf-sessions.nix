{pkgs, ...}: let
  fzf-sessions = pkgs.writeShellScriptBin "fzf-sessions" ''

  if [ "$TERM" = "tmux-256color" ] && [ -n "$TMUX" ]; then

    selection=$(tmux list-sessions \
      | while read line; do echo ''${line%%:*}; done \
      | fzf)

    tmux switch -t "$selection"
  fi
  '';
in {home.packages = [fzf-sessions];}
