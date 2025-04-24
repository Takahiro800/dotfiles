-- bootstrap lazy.nvim, LazyVim and your plugins

if vim.g.vscode then
  vim.cmd("runtime ../nvim.bak/vscode/vscode.init.vim")
  vim.cmd("runtime ../nvim.bak/init/options.init.vim")
  -- else
  --   require("config.lazy")
end

require("config.lazy")

-- コメントの自動継続を無効化（全ファイルタイプで）
vim.api.nvim_create_autocmd("FileType", {
  pattern = "*",
  callback = function()
    vim.opt_local.formatoptions:remove({ "c", "r", "o" })
  end,
})
