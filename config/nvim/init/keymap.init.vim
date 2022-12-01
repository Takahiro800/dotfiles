" terminal のインサートモードを抜ける
tnoremap <C-n> <C-\><C-n>
tnoremap <C-q> <C-\><C-n>:q<CR>

" normalモードからterminalモードに移行
" nnoremap <silent> tt <cmd>terminal<CR>
nnoremap <A-t> <cmd>terminal<CR>
nnoremap cc <cmd>terminal<CR>

" 入力モード中に素早くjjと入力した場合はESCとみなす
inoremap <silent> jj <Esc>:<C-u>w<CR>

" escのみの場合
inoremap <silent> jk <Esc>

" leaderをスペースへ設定
let mapleader = "\<Space>"

" shift + tab
inoremap <S-Tab> <C-d>

" 移動系
nnoremap zk zt
nnoremap zj zb

" tab
nnoremap <S-h> :tabprevious<CR>
nnoremap <S-l> :tabnext<CR>
nnoremap <Leader>ta :tab ba<CR>
nnoremap <Leader>tc :tabclose<CR>
nnoremap <Leader>tn :tabnew<CR>
" nnoremap <Tab>l :+tabmove
" nnoremap <Tab>h :-tabmove

" These commands will navigate through buffers in order
" regardless of which mode you are using  e.g. if you change
" the order of buffers :bnext and :bprevious will not respect the custom ordering
nnoremap <silent>[b :BufferLineCycleNext<CR>
nnoremap <silent>b] :BufferLineCyclePrev<CR>

" These commands will move the current buffer backwards or forwards in the bufferline
" ここで並び替えをする
nnoremap <Tab>l :BufferLineMoveNext<CR>
nnoremap <Tab>h :BufferLineMovePrev<CR>

" These commands will sort buffers by directory, language, or a custom criteria
nnoremap <silent>be :BufferLineSortByExtension<CR>
nnoremap <silent>bd :BufferLineSortByDirectory<CR>
nnoremap <silent><mymap> :lua require'bufferline'.sort_buffers_by(function (buf_a, buf_b) return buf_a.id < buf_b.id end)<CR>



" 「Spaceキー + 各種キー」のようなキー操作マッピング
"" 保存
nnoremap <Leader>w <Cmd>StripWhitespace<CR>:w<CR>

"" 終了
nnoremap <Leader>q :q<CR>
noremap ws <Cmd>StripWhitespace<CR>:w<CR>


"" 編集
nnoremap <Leader>e :e
imap <C-f> <right>

" telescope
nnoremap <leader>ff <cmd>Telescope find_files<cr>
nnoremap <D-p> <cmd>Telescope find_files<cr>
nnoremap <leader>fg <cmd>Telescope live_grep<cr>
nnoremap <leader>fb <cmd>Telescope buffers<cr>
nnoremap <leader>fh <cmd>Telescope help_tags<cr>
nnoremap <C-f> <cmd>Telescope frecency<cr>


" 各記号の入力
inoremap <C-n> _
inoremap <C-o> +
inoremap <C-a> =
inoremap <C-z> -

" sidebar
" nnoremap <M-s> <cmd>SidebarNvimToggle<cr>
nnoremap <A-f> <cmd>SidebarNvimToggle<cr>
nnoremap ßf <cmd>SidebarNvimFocus<cr>
nnoremap <Leader>nt <cmd>Neotree toggle<CR>
nnoremap <Leader>ng <cmd>Neotree float git_status<CR>

" hop
nnoremap <silent> f :HopWord<CR>
nnoremap s :HopWord<CR>
nnoremap <Leader>hl :HopLine<CR>
" nnoremap <silent> f :HopChar1<CR>

nnoremap t <cmd>ToggleTerm<cr>

nnoremap ]w :NextTrailingWhitespace<CR>
nnoremap [w :PrevTrailingWhitespace<CR>
" comment-box
" left aligned fixed size box with left aligned text
nnoremap <Leader>bc <Cmd>lua require('comment-box').accbox(7)<CR><esc>
vnoremap <Leader>bc <Cmd>lua require('comment-box').accbox(7)<CR><esc>

" centered adapted box with centered text
nnoremap <Leader>bb <Cmd>lua require('comment-box').lbox(19)<CR><esc>
vnoremap <Leader>bb <Cmd>lua require('comment-box').lbox(19)<CR>

