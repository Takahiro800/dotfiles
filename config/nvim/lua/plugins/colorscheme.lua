return {
  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup({
        background = "soft",
      })
    end,
  },
  {
    "sainnhe/gruvbox-material",
    opts = {
      terminal_colors = false,
    },
  },
  -- {
  --   "xiyaowong/transparent.nvim",
  -- },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
