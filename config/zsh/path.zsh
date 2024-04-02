## goのパスを設定
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

## anyenv
export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"

# rbenvのpath
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"

# yarn global addのpath
export PATH="$PATH:`yarn global bin`"

# aws cli v2のpath
export PATH=/usr/local/bin:$PATH

## github cli コマンド補完
eval "$(gh completion -s zsh)"

# Set up fzf key bindings and fuzzy completion
eval "$(fzf --zsh)"
eval "$(zoxide init zsh)"
alias zi='zi'

eval "$(fzf --zsh)"
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
export FZF_DEFAULT_COMMAND='rg --files --hidden --glob "!.git"'
export FZF_CTRL_R_OPTS="--reverse"
export FZF_TMUX_OPTS="-p"

export FZF_DEFAULT_OPTS='
        --height 40% --layout=reverse --border
        --color fg:188,bg:233,hl:103,fg+:222,bg+:014,hl+:104,gutter:233
        --color info:183,prompt:110,spinner:107,pointer:014,marker:215
        '


