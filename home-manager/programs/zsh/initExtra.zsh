PROMPT="%(?.%F{green}🢂.%F{red}🢂)%f "
RPROMPT='%2~ $(git_super_status) %*'

ZSH_THEME_GIT_PROMPT_STAGED="%{$fg[green]%}%{●%G%}"
ZSH_THEME_GIT_PROMPT_CHANGED="%{$fg[red]%}%{✚%G%}"

KEYTIMEOUT=15

# bindkey -M viins '\e.' insert-last-word
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

ZVM_VI_INSERT_ESCAPE_BINDKEY=jk

eval "$(direnv hook zsh)"
