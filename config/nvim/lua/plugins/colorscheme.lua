return {
  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup({
        background = "medium",
      })
    end,
  },
  -- {
  --   "sainnhe/gruvbox-material",
  --   opts = {
  --     terminal_colors = true,
  --   },
  -- },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
  },
  {
    "rebelot/kanagawa.nvim",
  },
  {
    "xiyaowong/transparent.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "kanagawa",
      -- colorscheme = "catppuccin",
      -- colorscheme = "gruvbox-material",
    },
  },
}
