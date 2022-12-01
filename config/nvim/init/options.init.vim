" #################### 見た目 ####################
" colorscheme nordfox


" 行番号を表示
set number

" yでコピーした時にクリップボードに入る
set guioptions+=a

" ヤンクでクリップボードにコピー
set clipboard+=unnamedplus

" terminal modeでのshell
set sh=zsh

" 終了時に確認する
set confirm

" タブ一覧を表示
set showtabline=3

set termguicolors

set expandtab tabstop=2 shiftwidth=2

" ######################## 検索・置換 ########################

set ignorecase " 大文字小文字の区別なく検索する
set smartcase " 検索文字列に大文字が含まれている場合は区別して検索する
set wrapscan " 検索時に最後まで行ったら最初に戻る
set hlsearch " 検索語をハイライト表示
set incsearch " 検索文字列入力時に順次対象文字列にヒットさせる
set inccommand=split " インタラクティブに変更

