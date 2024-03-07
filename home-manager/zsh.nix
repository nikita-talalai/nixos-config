{ config, ... }:

{
   programs.zsh = {
      enable = true;
      enableCompletion = true;
      enableAutosuggestions = true;
      syntaxHighlighting.enable = true;

      shellAliases = {
         nvim-new = 'NVIM_APPNAME="nvim-kickstart" nvim'
      };

      history.size = 10000;
      history.path = "${config.xdg.dataHome}/zsh/history";

      plugins = [
         {
            
         };
      ];
   };
}
