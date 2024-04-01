-- bootstrap lazy.nvim, LazyVim and your plugins
if vim.g.vscode then
  vim.cmd("runtime ../nvim.bak/init/vscode.init.vim")
  vim.cmd("runtime ../nvim.bak/init/options.init.vim")
  -- else
  --   require("config.lazy")
end
require("config.lazy")
