call plug#begin('~/.local/share/nvim/plugged')
Plug 'sainnhe/gruvbox-material'

call plug#end()

colorscheme gruvbox-material

" terminal のインサートモードを抜ける
:tnoremap <C-n> <C-\><C-n>

" 行番号を表示
set number

" yでコピーした時にクリップボードに入る
set guioptions+=a

" ヤンクでクリップボードにコピー
set clipboard+=unnamedplus

" terminal modeでのshell
set sh=zsh

" neovim-remote
let nvrcmd      = "nvr --remote-wait -cc 'call NvrBeforeCmd()' -c 'call NvrAfterCmd()'"
let $VISUAL     = nvrcmd
let $GIT_EDITOR = nvrcmd

nnoremap <silent> <Leader>t :<C-u>silent call <SID>tig_status()<CR>

function! s:tig_status() abort
    call s:open_term('tig status')
endfunction

function! s:open_term(cmd) abort
    let split = s:split_type()

    call execute(printf('%s term://%s', split, a:cmd))

    setlocal bufhidden=delete
    setlocal noswapfile
    setlocal nobuflisted
endfunction

function! s:split_type() abort
    " NOTE: my cell ratio: width:height == 1:2.1
    let width = winwidth(win_getid())
    let height = winheight(win_getid()) * 2.1

    if height > width
        return 'split'
    else
        return 'vsplit'
    endif
endfunction

" leaderをスペースへ設定
let mapleader = "\<Space>"

" jj でesc
inoremap jj <Esc>

" 「Spaceキー + 各種キー」のようなキー操作マッピング
" 保存 
nnoremap <Leader>w :w<CR>

" 終了
nnoremap <Leader>q :q<CR>

" 終了時に確認する
set confirm
