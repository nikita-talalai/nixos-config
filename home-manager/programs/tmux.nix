{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "Space";
    terminal = "screen-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    tmuxinator.enable = true;
    extraConfig = ''
    set-option -g status-position top
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
    ];
  };
}
