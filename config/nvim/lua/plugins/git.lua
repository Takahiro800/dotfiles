return {
  {
    "f-person/git-blame.nvim",
    -- blameメッセージが表示されなくなるので keymaps.luaに記述
    opts = {
      date_format = "%Y-%m-%d",
      enabled = true,
    },
  },
  {
    -- Github上の共有リンク用
    "ruifm/gitlinker.nvim",
    dependencies = "nvim-lua/plenary.nvim",
    opts = {},
    keys = {
      { "<leader>gy", '<cmd>lua require"gitlinker".get_repo_url()<cr>' },
    },
  },
  {
    "pwntester/octo.nvim",
    cmd = "Octo",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-telescope/telescope.nvim",
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("octo").setup({ enable_builtin = true })
      vim.cmd([[hi OctoEditable guibg=none]])
    end,
    keys = {
      { "<leader>o", "<cmd>Octo<cr>", desc = "Octo" },
    },
  },
}
