-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<Esc>")

-- New tab
keymap.set("n", "te", ":tabedit")
keymap.set("n", "<tab>", ":tabnext<Return>", opts)
keymap.set("n", "<s-tab>", ":tabprev<Return>", opts)

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- -- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Ctrlで記号入力
keymap.set("i", "<C-n>", "_", opts)
keymap.set("i", "<C-o>", "+", opts)
keymap.set("i", "<C-m>", "=", opts)
keymap.set("i", "<C-i>", "-", opts)

-- <Leader>で保存, 終了
keymap.set("n", "<Leader>w", ":w<CR>", opts)
keymap.set("n", "<Leader>q", ":q<CR>", opts)

-- nohilight
keymap.set("n", "noh", ":noh<CR>", opts)

-- hop
keymap.set("n", "f", ":HopWord<cr>", opts)
keymap.set("n", "s", ":HopWord<cr>", opts)

-- 行頭・行末
keymap.set("n", "<Left>", "0")
keymap.set("n", "<Right>", "$")

-- 折り返し
keymap.set("n", "j", "gj", opts)
keymap.set("n", "k", "gk", opts)

-- nohilight
keymap.set("n", "noh", ":noh", opts)

-- 検索
keymap.set("n", "/", ":/", opts)

keymap.set("i", "<Right>", 'copilot#Accept("\\<CR>")', {
  expr = true,
  replace_keycodes = false,
})
vim.g.copilot_no_tab_map = true

-- nvim-cmp
return {
  "hrsh7th/nvim-cmp",
  keys = {
    -- disable the keymap
    { "<C-n>", false },
  },
}
