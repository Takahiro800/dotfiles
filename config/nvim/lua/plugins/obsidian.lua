return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/git/Obsidian-Vault",
      },
    },
    daily_notes = {
      folder = "02_Daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      template = nil,
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
  },
}
