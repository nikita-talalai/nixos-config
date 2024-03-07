{ config, pkgs, ... }:

{
   programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
         nvim-new = ''NVIM_APPNAME="nvim-kickstart" nvim'';
      };

      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";
      
      plugins = [
      {
        name = "fast-syntax-highlighting";
        file = "fast-syntax-highlighting.plugin.zsh";
        src = "${pkgs.zsh-fast-syntax-highlighting}/share/zsh/site-functions";
      }
      {
        name = "zsh-fzf-tab";
        file = "fzf-tab.plugin.zsh";
        src = "${pkgs.zsh-fzf-tab}/share/fzf-tab";
      }
      {
        name = "forgit";
        file = "forgit.plugin.zsh";
        src = "${pkgs.zsh-forgit}/share/zsh/zsh-forgit";
      }
    ];
   };
}
