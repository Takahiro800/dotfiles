call plug#begin('~/.config/nvim/plugged')

" ColorScheme
Plug 'EdenEast/nightfox.nvim'

Plug 'kyazdani42/nvim-web-devicons' " Recommended (for coloured icons)
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }

" Rename
Plug 'nanozuki/tabby.nvim'

" Noice
Plug 'folke/noice.nvim'
Plug 'MunifTanjim/nui.nvim'
Plug 'rcarriga/nvim-notify'

" for LSP
Plug 'neoclide/coc.nvim', {'branch': 'release'}
" Plug 'jose-elias-alvarez/null-ls.nvim'

" Plug 'hrsh7th/nvim-cmp'
" Plug 'onsails/lspkind.nvim'
" Plug 'hrsh7th/cmp-nvim-lsp'
" Plug 'hrsh7th/cmp-nvim-lsp-signature-help'
" Plug 'hrsh7th/cmp-nvim-lsp-document-symbol'
" Plug 'hrsh7th/cmp-buffer'
" Plug 'hrsh7th/cmp-path'
" Plug 'ray-x/cmp-treesitter'
" Plug 'hrsh7th/cmp-cmdline'

Plug 'neovim/nvim-lspconfig'

" コードチェック
Plug 'dense-analysis/ale'

"for Rust
Plug 'rust-lang/rust.vim'

" telescope
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }
Plug 'kkharji/sqlite.lua'
Plug 'nvim-telescope/telescope-frecency.nvim'

" trreistter
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'yioneko/nvim-yati'
Plug 'p00f/nvim-ts-rainbow'

Plug 'haringsrob/nvim_context_vt'

" ハイライト系
Plug 'RRethy/vim-illuminate'

" サイドバー
Plug 'sidebar-nvim/sidebar.nvim'

" scrollbar
Plug 'petertriho/nvim-scrollbar'
Plug 'kevinhwang91/nvim-hlslens'

" 移動系
Plug 'phaazon/hop.nvim'

" surround
Plug 'machakann/vim-sandwich'

" ファイラー
Plug 'nvim-neo-tree/neo-tree.nvim'
Plug 'nvim-lua/plenary.nvim'

" mark
Plug 'chentoast/marks.nvim'

" termianl
Plug 'akinsho/toggleterm.nvim', {'tag' : '*'}

" indent
Plug 'lukas-reineke/indent-blankline.nvim'

" アウトライン
Plug 'stevearc/aerial.nvim'

" Comment
Plug 'numToStr/Comment.nvim'
Plug 'danymat/neogen'

Plug 'LudoPinelli/comment-box.nvim'

" 括弧
Plug 'windwp/nvim-autopairs'

" git
Plug 'lewis6991/gitsigns.nvim'

" whitespace
Plug 'ntpeters/vim-better-whitespace'

" Ruby
Plug 'tpope/vim-endwise'

Plug 'nvim-lualine/lualine.nvim'

call plug#end()

" aleとcoc.nvimの連携
let g:ale_disable_lsp = 1
let g:ale_lint_on_text_changed = 1

let g:coc_global_extensions = ['coc-solargraph']

lua << EOF
-- if vim.g.vscode then return end
vim.cmd("colorscheme nordfox")

require('bufferline').setup({
 options = {
    mode = "tabs",
    separator_style = 'slant',
    always_show_bufferline = true,
    show_buffer_close_icons = false,
    show_close_icon = false,
    color_icons = true
 }
})

vim.opt.cmdheight = 1

require('noice').setup {
  background_colour = "#000000",
  cmdline = {
    icons = {
      ["/"] = { icon = " ", hl_group = "DiagnosticWarn" },
      ["?"] = { icon = " ", hl_group = "DiagnosticWarn" },
      [":"] = { icon = " ", hl_group = "DiagnosticInfo", firstc = false },
    },
  },
  routes = {
    {
      view = "cmdline",
      filter = { event = "msg_show", kind = "search_count" },
      opts = { stop = false },
    },
  },
}


require'nvim-treesitter.configs'.setup {
  yati = { enable = true },
  highlight = {
    enable = true,  -- syntax highlightを有効にする
  },
  ensure_installed = {"rust", "ruby", "go", "java"},
  rainbow = {
    enable = true,
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = 100, -- Do not enable for files with more than n lines, int
  },
  matchup = {
    enable = true,              -- mandatory, false will disable the whole extension
    -- disable = { "c", "ruby" },  -- optional, list of language that will be disabled
    -- [options]
  },
  endwise = {
        enable = true,
    },
}

require('nvim_context_vt').setup({
  enabled = true,
  prefix = '',
})

require("sidebar-nvim").setup()

require("scrollbar").setup()
require("scrollbar.handlers.search").setup()

require('hlslens').setup()
local kopts = {noremap = true, silent = true}
vim.api.nvim_set_keymap('n', 'n',
    [[<Cmd>execute('normal! ' . v:count1 . 'n')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', 'N',
    [[<Cmd>execute('normal! ' . v:count1 . 'N')<CR><Cmd>lua require('hlslens').start()<CR>]],
    kopts)
vim.api.nvim_set_keymap('n', '*', [[*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '#', [[#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g*', [[g*<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', 'g#', [[g#<Cmd>lua require('hlslens').start()<CR>]], kopts)
vim.api.nvim_set_keymap('n', '<Leader>l', ':noh<CR>', kopts)

require'hop'.setup{
  hint_position = require'hop.hint'.HintPosition.END,
 }

require'marks'.setup {
  default_mappings = true,
  builtin_marks = { ".", "<", ">", "^" },
  cyclic = true,
  force_write_shada = false,
  refresh_interval = 250,
  sign_priority = { lower=10, upper=15, builtin=8, bookmark=20 },
  -- disables mark tracking for specific filetypes. default {}
  excluded_filetypes = {},
  -- marks.nvim allows you to configure up to 10 bookmark groups, each with its own
  -- sign/virttext. Bookmarks can be used to group together positions and quickly move
  -- across multiple buffers. default sign is '!@#$%^&*()' (from 0 to 9), and
  -- default virt_text is "".
  bookmark_0 = {
    sign = "⚑",
    virt_text = "hello world",
    -- explicitly prompt for a virtual line annotation when setting a bookmark from this group.
    -- defaults to false.
    annotate = false,
  },
  mappings = {}
}

require("toggleterm").setup{
  open_mapping = [[<c-\>]],
  direction = 'float',
  shade_terminals = false,
  on_open = function(term)
    vim.cmd("startinsert!")
    vim.api.nvim_buf_set_keymap(term.bufnr, "n", "q", "<cmd>close<CR>", {noremap = true, silent = true})
  end,
}

-- indent blankline
vim.opt.list = true
vim.opt.listchars:append "space:⋅"
-- vim.opt.listchars:append "eol:↴"

require("indent_blankline").setup {
    space_char_blankline = " ",
    show_current_context = true,
    show_current_context_start = true,
}

--Comment

require('Comment').setup{
    toggler = {
        ---Line-comment toggle keymap
        line = 'gcc',
        -- line = '<Leader>/',
        ---Block-comment toggle keymap
        block = 'gbc',
    },
    ---LHS of operator-pending mappings in NORMAL and VISUAL mode
    opleader = {
        ---Line-comment keymap
        line = 'gc',
        ---Block-comment keymap
        block = 'gb',
    },
    ---LHS of extra mappings
    extra = {
        ---Add comment on the line above
        above = 'gcO',
        ---Add comment on the line below
        below = 'gco',
        ---Add comment at the end of line
        eol = 'gcA',
    },
}

require('comment-box').setup({
  doc_width = 100,
  box_width = 100
})

-- アウトライン
require('aerial').setup({})

require('neogen').setup {
    enabled = true,             --if you want to disable Neogen
    input_after_comment = true, -- (default: true) automatic jump (with insert mode) on inserted annotation
    -- jump_map = "<C-e>"       -- (DROPPED SUPPORT, see [here](#cycle-between-annotations) !) The keymap in order to jump in the annotation fields (in insert mode)
}

require("nvim-autopairs").setup {}
require("nvim-autopairs").add_rules(require('nvim-autopairs.rules.endwise-ruby'))

require('gitsigns').setup({
    current_line_blame = true,
})

require"telescope".load_extension("frecency")


require('lualine').setup{
    options = {
    icons_enabled = true,
    theme = 'palgenight',
    section_separators = { left = '', right = '' },
    component_separators = { left = '', right = '' },
    disabled_filetypes = {}
  },
  sections = {
    lualine_a = { 'mode' },
    lualine_b = { 'branch' },
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 0 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = {
      { 'diagnostics', sources = { "nvim_diagnostic" }, symbols = { error = ' ', warn = ' ', info = ' ',
        hint = ' ' } },
      'encoding',
      'filetype'
    },
    lualine_y = { 'progress' },
    lualine_z = { 'location' }
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = { {
      'filename',
      file_status = true, -- displays file status (readonly status, modified status)
      path = 1 -- 0 = just filename, 1 = relative path, 2 = absolute path
    } },
    lualine_x = { 'location' },
    lualine_y = {},
    lualine_z = {}
  },
  tabline = {},
  extensions = { 'fugitive' }
}
EOF

" surround
runtime macros/sandwich/keymap/surround.vim

" whitespace
let g:better_whitespace_guicolor='#af0000'
" let g:better_whitespace_enabled=1
let g:strip_whitespace_on_save = 1
let g:strip_max_file_size = 500
let g:strip_whitespace_confirm=0
let g:current_line_whitespace_disabled_soft=1
autocmd BufWritePre * :StripWhitespace
autocmd TermOpen * :DisableWhitespace


autocmd ColorScheme * highlight Comment ctermfg=57
autocmd ColorScheme * highlight Comment 	guifg=#5f00ff

" coc.nvimの補完メニューの選択中color
hi CocMenuSel guifg=#cccccc guibg=#2a3d75
