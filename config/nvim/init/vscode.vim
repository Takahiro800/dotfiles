" leaderをスペースへ設定
let mapleader = "\<Space>"

call plug#begin('~/.config/nvim/plugged')
  Plug 'asvetliakov/vim-easymotion'
  Plug 'machakann/vim-sandwich'
call plug#end()

nmap s <Plug>(easymotion-bd-w)
nmap f <Plug>(easymotion-bd-e)
nnoremap <Leader><Leader>l <Plug>(easymotion-bd-jk)

" 保存
nnoremap <Leader>w <cmd>call VSCodeNotify('workbench.action.files.save')<CR>

" タブの移動
nnoremap <S-l> <cmd>call VSCodeNotify('workbench.action.nextEditor')<CR>
nnoremap <S-h> <cmd>call VSCodeNotify('workbench.action.previousEditor')<CR>

nnoremap zk zt
nnoremap zj zb

" leader + l, hで行頭,行末
vnoremap <Leader>l $
vnoremap <Leader>h ^
nnoremap <Leader>l $
nnoremap <Leader>h ^

let g:EasyMotion_do_mapping = 0
let g:EasyMotion_smartcase = 1

" markdown関係
nnoremap <Leader>mp <cmd>call VSCodeNotify('markdown.showPreviewToSide')<CR>

" github関係
nnoremap <Leader>gl <cmd>call VSCodeNotify('issue.copyGithubPermalink')<CR>
nnoremap <Leader>gm <cmd>call VSCodeNotify('issue.copyMarkdownGithubPermalink')<CR>
nnoremap <Leader>gd <cmd>call VSCodeNotify('git.timeline.openDiff')<CR>

" bookmark関係
nnoremap <Leader>mm <cmd>call VSCodeNotify('bookmarksExplorer.focus')<CR>
nnoremap <Leader>ml <cmd>call VSCodeNotify('bookmarks.listFromAllFiles')<CR>
nnoremap <Leader>ma <cmd>call VSCodeNotify('bookmarks.clearFromAllFiles')<CR>
nnoremap <Leader>mc <cmd>call VSCodeNotify('bookmarks.toggle')<CR>
nnoremap m <cmd>call VSCodeNotify('bookmarks.toggleLabeled')<CR>

" copy file
nnoremap <Leader>cp <cmd>call VSCodeNotify('copyFilePath')<CR>
nnoremap <Leader>cn <cmd>call VSCodeNotify('copy-file-name.copyFileNameWithExtension')<CR>

" 単語をクリップボードと入れ替え
nnoremap <Leader>r diw"0P

" 各記号の入力
inoremap <C-i> -
inoremap <C-o> +
inoremap <C-m> =
inoremap <C-n> _

" terminal
nnoremap t <cmd>call VSCodeNotify('workbench.action.terminal.toggleTerminal')<CR>
