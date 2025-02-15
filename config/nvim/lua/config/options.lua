-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.autoindent = true
vim.opt.smartindent = true
vim.opt.relativenumber = false
vim.opt.expandtab = true
vim.opt.swapfile = false
vim.tabstop = 2
-- vim.opt.conceallevel = 1

vim.g.copilot_filetypes = {
  markdown = false,
  csv = false,
  sql = false,
}
