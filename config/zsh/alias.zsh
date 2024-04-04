# Alias
## tigのエイリアス
alias t="tig"

## git
alias g="git"

## gitフォルダへの移動
alias cg="cd ~/git"

# lsd
alias ls='lsd'
alias ll='ls -l'
alias lla='ls -la'
alias lt='ls --tree'

## docker周りのエイリアス
alias dcb='docker compose build'
alias dcu='docker compose up'
alias dcr='docker compose run'
alias dcrr='docker compose run --rm'
alias dcre='docker compose restart'
alias dx='docker compose exec'
alias dcd='docker compose down'
alias dp='docker ps'
alias dcl='docker compose logs'
alias dcc='docker compose config --services'
alias dx ='docker compose exec'

## localhost立ち上げのため
alias lhost='(){open http://localhost:$1}'

## BigQuery用
### csv,jsonの一括作成
alias tdf='(){touch $1.csv $1.json}'

### tableの作成
alias bql='(){bq load --source_format=CSV $1.$2 $3.csv $3.json}'

## Terraform
alias tf='terraform'

## Exercism
alias ex='exercism'
alias es='exercism submit'

## neovimのterminalを一括で開く
alias nt='nvim -c :term'

# Ocaml用
## 対話モードでカーソルキーが使えるように
alias ocaml='rlwrap ocaml'

# cargo-atcoder
alias ca='cargo atcoder'
alias can='cargo atcoder new'
alias cat='cargo atcoder test'
alias cas='cargo atcoder submit'

# swapファイル
alias cswap='cd ~/.local/state/nvim/swap'

# code -r .
alias cr='code -r'

