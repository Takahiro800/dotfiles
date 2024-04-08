return {
  -- {
  --   "github/copilot.vim",
  -- },
  {
    "zbirenbaum/copilot.lua",
    opts = {
      suggestion = { enabled = false },
      panel = { enabled = false },
      filetypes = {
        markdown = false,
        csv = false,
        sql = false,
      },
    },
  },
}
