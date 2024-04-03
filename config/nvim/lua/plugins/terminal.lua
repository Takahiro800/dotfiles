return {
  {
    "akinsho/toggleterm.nvim",
    config = true,
    cmd = "ToggleTerm",
    keys = {
      { "<C-_>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" },
      { "<C-/>", "<cmd>ToggleTerm<cr>", desc = "Toggle floating terminal" },
      {
        "<leader>gg",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({
            cmd = "lazygit",
            direction = "float",
            hidden = true,
          })

          lazygit:toggle()
        end,
        desc = "Lazygit",
      },
      {
        "<M-g>",
        function()
          local Terminal = require("toggleterm.terminal").Terminal
          local lazygit = Terminal:new({
            cmd = "lazygit",
            direction = "float",
            hidden = true,
          })

          lazygit:toggle()
        end,
        desc = "Lazygit for not using tmux",
      },
    },
    opts = {
      open_mapping = [[<C-/>]],
      direction = "float",
      -- shade_filetypes = {},
      -- hide_numbers = true,
      -- insert_mappings = true,
      -- terminal_mappings = true,
      -- start_in_insert = true,
      -- close_on_exit = true,
    },
  },
}
