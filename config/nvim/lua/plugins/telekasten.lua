return {
  {
    "renerocksai/telekasten.nvim",
    dependencies = { "nvim-telescope/telescope.nvim" },
    keys = {
      { "<leader>zz", "<cmd>Telekasten panel<CR>", desc = "Telekasten panel" },
      { "<leader>zf", "<cmd>Telekasten search_notes<CR>", desc = "Telekasten search_notes" },
      { "<leader>zt", "<cmd>Telekasten goto_today<CR>", desc = "Telekasten today daily" },
      { "<leader>zc", "<cmd>Telekasten show_calnedar<CR>", desc = "Telekasten show calendar" },
      { "tt", "<cmd>Telekasten toggle_todo<CR>", desc = "toggle TODO" },
    },
    opts = {
      home = vim.fn.expand("~/git/Obsidian-Vault"),
      auto_set_filetype = false,
    },
  },
  {
    "renerocksai/calendar-vim",
  },
}
