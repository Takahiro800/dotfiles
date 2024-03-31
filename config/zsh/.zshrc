### Added by Zinit's installer
if [[ ! -f $HOME/.local/share/zinit/zinit.git/zinit.zsh ]]; then
    print -P "%F{33} %F{220}Installing %F{33}ZDHARMA-CONTINUUM%F{220} Initiative Plugin Manager (%F{33}zdharma-continuum/zinit%F{220})…%f"
    command mkdir -p "$HOME/.local/share/zinit" && command chmod g-rwX "$HOME/.local/share/zinit"
    command git clone https://github.com/zdharma-continuum/zinit "$HOME/.local/share/zinit/zinit.git" && \
        print -P "%F{33} %F{34}Installation successful.%f%b" || \
        print -P "%F{160} The clone has failed.%f%b"
fi

source "$HOME/.local/share/zinit/zinit.git/zinit.zsh"
autoload -Uz _zinit
(( ${+_comps} )) && _comps[zinit]=_zinit

# Load a few important annexes, without Turbo
# (this is currently required for annexes)
zinit light-mode for \
    zdharma-continuum/zinit-annex-as-monitor \
    zdharma-continuum/zinit-annex-bin-gem-node \
    zdharma-continuum/zinit-annex-patch-dl \
    zdharma-continuum/zinit-annex-rust
### End of Zinit's installer chunk

## 補完で小文字でも大文字にマッチさせる
zstyle ':completion:*' matcher-list 'm:{a-z}={A-Z}'

## 補完候補を一覧表示したとき、Tabや矢印で選択できるようにする
zstyle ':completion:*:default' menu select=1

## 補完一覧をカラー表示
autoload colors
zstyle ':completion:*' list-colors ''

## コマンド履歴検索
function peco-history-selection() {
  BUFFER=`history -n 1 | tac  | awk '!a[$0]++' | peco`
  CURSOR=$#BUFFER
  zle reset-prompt
}
zle -N peco-history-selection
bindkey '^R' peco-history-selection

## github cli コマンド補完
eval "$(gh completion -s zsh)"

## goのパスを設定
export GOPATH=$HOME
export PATH=$PATH:$GOPATH/bin

## ctrl + [ でGitディレクトリを検索・移動
function peco-src () {
  local selected_dir=$(ghq list -p | peco)
  if [ -n "$selected_dir" ]; then
    BUFFER="cd ${selected_dir}"
    zle accept-line
  fi
}
zle -N peco-src
bindkey '^]' peco-src


############################
# 分割ファイルの読み込み
############################
ZSHHOME="${HOME}/.zsh"

if [ -d $ZSHHOME -a -r $ZSHHOME -a \
     -x $ZSHHOME ]; then
    for i in $ZSHHOME/*; do
        [[ ${i##*/} = *.zsh ]] &&
            [ \( -f $i -o -h $i \) -a -r $i ] && . $i
    done
fi

export PATH="$HOME/.anyenv/bin:$PATH"
eval "$(anyenv init -)"


## google cloud sdkの導入
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/path.zsh.inc"
source "/opt/homebrew/Caskroom/google-cloud-sdk/latest/google-cloud-sdk/completion.zsh.inc"

# Rustの設定
source $HOME/.cargo/env


# rbenvのpath
[[ -d ~/.rbenv  ]] && \
  export PATH=${HOME}/.rbenv/bin:${PATH} && \
  eval "$(rbenv init -)"
# yarn global addのpath
export PATH="$PATH:`yarn global bin`"

# aws cliv2のpath
export PATH=/usr/local/bin:$PATH

function abc() {
    local contest_id="$1"
    local problem_id="$2"

    if [[ -z "$contest_id" ]] || [[ -z "$problem_id" ]]; then
        echo "コンテストIDと問題IDを指定してください。"
        return 1
    fi

    local problem_url="https://atcoder.jp/contests/abc${contest_id}/tasks/abc${contest_id}_${problem_id}"

    open "$problem_url"
}

function agc() {
    local contest_id="$1"
    local problem_id="$2"

    if [[ -z "$contest_id" ]] || [[ -z "$problem_id" ]]; then
        echo "コンテストIDと問題IDを指定してください。"
        return 1
    fi

    local problem_url="https://atcoder.jp/contests/agc${contest_id}/tasks/agc${contest_id}_${problem_id}"

    open "$problem_url"
}

function atc() {
    local contest_id="$1"
    local problem_id="$2"

    if [[ -z "$contest_id" ]] || [[ -z "$problem_id" ]]; then
        echo "コンテストIDと問題IDを指定してください。"
        return 1
    fi

    local problem_url="https://atcoder.jp/contests/${contest_id}/tasks/${contest_id}_${problem_id}"

    open "$problem_url"
}

# leetcode-cli
eval "$(leetcode completions)"
alias lc='leetcode'

# 日報を開く
function nippo() {
    issue_number=$(gh issue list -R Takahiro800/nippo --label "nippo" --limit 1 --json number |jq -r '.[0].number')
    gh issue view -R Takahiro800/nippo $issue_number --web
}

# Starship
eval "$(starship init zsh)"

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

# sheldon
eval "$(sheldon source)"
