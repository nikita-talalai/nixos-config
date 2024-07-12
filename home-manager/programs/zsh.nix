{
  config,
  pkgs,
  ...
}: {
  programs.zsh = {
    enable = true;
    dotDir = ".config/zsh";
    enableCompletion = true;
    autosuggestion.enable = true;
    syntaxHighlighting.enable = true;

    sessionVariables = {
      EDITOR = "nvim";
      PERSONAL = "$HOME/personal";
    };

    shellAliases = {
      ll = "eza --total-size";
    };

    history.size = 10000;
    history.path = "${config.xdg.dataHome}/zsh/history";

    defaultKeymap = "viins";

    initExtra = ''
      PROMPT="%(?.%F{green}🢂.%F{red}🢂)%f "
      RPROMPT='%2~ $(git_super_status) %*'

      ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{●%G%}"
      ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{✚%G%}"

      KEYTIMEOUT=15

      function zle-keymap-select {
         if [[ ''${KEYMAP} == vicmd ]] ||
            [[ $1 = 'block' ]]; then
            echo -ne '\e[1 q'

         elif [[ ''${KEYMAP} == main ]] ||
              [[ ''${KEYMAP} == viins ]] ||
              [[ ''${KEYMAP} = '''''' ]] ||
              [[ $1 = 'beam' ]]; then
              echo -ne '\e[5 q'
         fi
         }

      zle -N zle-keymap-select

      _fix_cursor() {
         echo -ne '\e[5 q'
      }

      precmd_functions+=(_fix_cursor)

      bindkey -M viins '\e.' insert-last-word
      bindkey -M viins 'jk' vi-cmd-mode
      bindkey "^H" backward-delete-char
      bindkey "^?" backward-delete-char
      bindkey -s "^F" 'fzf-sessions^J'
      bindkey -s "^G" 'fzf-windows^J'
      autoload edit-command-line
      zle -N edit-command-line
      bindkey -M vicmd v edit-command-line

      zstyle ':fzf-tab:*' fzf-command ftb-tmux-popup

      function bottom_prompt {
        tput cup $(($LINES-1)) 0
      }
      add-zsh-hook precmd bottom_prompt

        lfcd () {
          cd "$(command lf -print-last-dir "$@")"
        }

        tmp () {
          nix flake init -t "github:nikita-talalai/templates#$1"
          direnv allow
        }

        dev () {
          nix develop github:nikita-talalai/devShells#$1 -c zsh
        }

        eval "$(direnv hook zsh)"
    '';

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
      {
        name = "zsh-git-prompt";
        file = "zshrc.sh";
        src = "${pkgs.zsh-git-prompt}/share/zsh-git-prompt";
      }
    ];
  };
}
