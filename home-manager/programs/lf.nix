{
  programs.lf = {
    enable = true;
    extraConfig = ''
      cmd fzf_jump ''${{
        res="$(find . -maxdepth 5 | fzf --reverse --header='Jump to location')"
          if [ -n "$res" ]; then
            if [ -d "$res" ]; then
              cmd="cd"
            else
              cmd="select"
                fi
                res="$(printf '%s' "$res" | sed 's/\\/\\\\/g;s/"/\\"/g')"
                lf -remote "send $id $cmd \"$res\""
                fi
      }}
      map <c-f> :fzf_jump

      cmd fzf_search ''${{
        RG_PREFIX="rg --column --line-number --no-heading --color=always --smart-case "
          res="$(
              FZF_DEFAULT_COMMAND="$RG_PREFIX " \
              fzf --bind "change:reload:$RG_PREFIX {q} || true" \
              --ansi --layout=reverse --header 'Search in files' \
              | cut -d':' -f1 | sed 's/\\/\\\\/g;s/"/\\"/g'
              )"
          [ -n "$res" ] && lf -remote "send $id select \"$res\""
      }}
      map gs :fzf_search
    '';
  };
}
