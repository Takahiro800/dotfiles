return {
  {
    "neanias/everforest-nvim",
    config = function()
      require("everforest").setup({
        background = "medium",
      })
    end,
  },
  {
    "sainnhe/gruvbox-material",
  },
  {
    "xiyaowong/transparent.nvim",
  },
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "gruvbox-material",
    },
  },
}
