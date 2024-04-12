{ pkgs, ... }:

{
  programs.tmux = {
    enable = true;
    shortcut = "Space";
    terminal = "tmux-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    tmuxinator.enable = true;
    extraConfig = ''
    set-option -g status-position top
    set-option -ga terminal-overrides ",xterm-256color:RGB"
    '';
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
    ];
  };
}
