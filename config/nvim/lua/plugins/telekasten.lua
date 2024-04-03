return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    opts = {
      home = vim.fn.expand("~/git/Obsidian-Vault"),
      auto_set_filetype = false,
    },
    keys = {
      { "tt", "<Cmd>Telekasten toggle_todo<CR>", "Toggle TODO only .md" },
      { "<Leader>zz", "<Cmd>Telekasten panel<CR>", "Telekasten panel" },
      { "<Leader>zt", "<Cmd>Telekasten goto_today<CR>", "open today note" },
      { "<Leader>zf", "<Cmd>Telekasten search_notes<CR>", "Telekasten search notes" },
      { "<Leader>zc", "<Cmd>Telekasten show_calnedar<CR>", "Show Calendar" },
    },
  },
  {
    "renerocksai/calendar-vim",
  },
}
