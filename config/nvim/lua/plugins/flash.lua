return {
  {
    enabled = false,
    "folke/flash.nvim",
    opts = {
      search = {
        forward = true,
        multi_window = false,
        wrap = false,
        incremental = true,
      },
    },
  },
  {
    "smoka7/hop.nvim",
    version = "*",
    opts = {
      multi_windows = true,
      -- hint_position = require("hop.hint").HintPosition.END,
    },
  },
}
