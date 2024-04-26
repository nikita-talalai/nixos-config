{pkgs, ...}: {
  programs.tmux = {
    enable = true;
    shortcut = "Space";
    terminal = "tmux-256color";
    shell = "${pkgs.zsh}/bin/zsh";
    keyMode = "vi";
    baseIndex = 1;
    customPaneNavigationAndResize = true;
    disableConfirmationPrompt = true;
    tmuxinator.enable = true;
    extraConfig = ''
      set-option -g status-position top
      set-option -ga terminal-overrides ",xterm-256color:RGB"
      bind-key -r C-f run-shell "tmux neww fzf-sessions"
    '';
    plugins = with pkgs; [
      tmuxPlugins.catppuccin
      tmuxPlugins.tilish
      tmuxPlugins.resurrect
      tmuxPlugins.extrakto
    ];
  };
}
