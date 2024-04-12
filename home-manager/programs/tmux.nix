{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "Space";
    terminal = "screen-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
  };
}
