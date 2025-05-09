-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here
--
local keymap = vim.keymap
local opts = { noremap = true, silent = true }

keymap.set("i", "jk", "<Esc>")
keymap.set("t", "<C-[>", "<C-\\><C-n>")
keymap.set("t", "<ESC>", "<C-\\><C-n>")

-- Split window
keymap.set("n", "ss", ":split<Return>", opts)
keymap.set("n", "sv", ":vsplit<Return>", opts)

-- Move window
keymap.set("n", "sh", "<C-w>h")
keymap.set("n", "sk", "<C-w>k")
keymap.set("n", "sj", "<C-w>j")
keymap.set("n", "sl", "<C-w>l")

-- Ctrlで記号入力
keymap.set("i", "<C-n>", "_", opts)
keymap.set("i", "<C-m>", "=", opts)
keymap.set("i", "<C-o>", "+", opts)
keymap.set("i", "<C-i>", "-", opts)

-- git blame
keymap.set("n", "<leader>go", "<Cmd>GitBlameOpenCommitURL<cr>", opts)
keymap.set("n", "<leader>gc", "<Cmd>GitBlameCopySHA<cr>", opts)
keymap.set("n", "<leader>gp", "<Cmd>GitBlameCopyCommitURL<cr>", opts)

-- git lenker
keymap.set(
  "n",
  "<leader>gy",
  '<cmd>lua require"gitlinker".get_buf_range_url("n", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
  { silent = true }
)
keymap.set(
  "v",
  "<leader>gy",
  '<cmd>lua require"gitlinker".get_buf_range_url("v", {action_callback = require"gitlinker.actions".open_in_browser})<cr>',
  { silent = true }
)

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

-- window resize
keymap.set("n", "<leader>hi", ":resize +5<CR>", opts)
keymap.set("n", "<leader>hd", ":resize -5<CR>", opts)
keymap.set("n", "<leader>vi", ":vertical resize +20<CR>", opts)
keymap.set("n", "<leader>vd", ":vertical resize -20<CR>", opts)

-- nvim-cmp
return {
  "hrsh7th/nvim-cmp",
  keys = {
    -- disable the keymap
    { "<C-n>", false },
  },
}
