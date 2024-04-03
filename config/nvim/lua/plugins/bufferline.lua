return {
  {
    "akinsho/bufferline.nvim",
    event = "VeryLazy",
    keys = {
      { "<leader>gp", ":BufferLinePick<CR>", desc = "pick buffer line" },
    },
    opts = {
      options = {
        -- mode = "tabs",
        always_show_bufferline = true,
        show_buffer_close_icons = false,
        show_close_icon = false,
      },
    },
  },
}
