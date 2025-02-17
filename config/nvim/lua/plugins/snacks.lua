return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          files = {
            hidden = true,
            ignored = true,
          },
          explorer = {
            focus = "list",
            auto_close = true,
            jump = { close = false },
            hidden = true,
            ignored = true,
            layout = { preset = "default", preview = true, reverse = false },
            win = {
              input = {
                keys = {
                  ["<c-/>"] = { "toggle_focus", mode = { "i", "n" } },
                },
              },
              list = {
                keys = {
                  ["<c-d>"] = { "preview_scroll_down", mode = { "i", "n" } },
                  ["<c-u>"] = { "preview_scroll_up", mode = { "i", "n" } },
                  ["<c-j>"] = { "preview_scroll_down", mode = { "i", "n" } },
                  ["<c-k>"] = { "preview_scroll_up", mode = { "i", "n" } },
                  ["<c-/>"] = { "toggle_focus", mode = { "i", "n" } },
                },
              },
            },
          },
        },
      },
    },
    keys = {
      {
        "<leader>sg",
        function()
          vim.ui.input({ prompt = "Enter directory (default: cwd): " }, function(dir)
            dir = (dir and dir ~= "") and dir or nil
            Snacks.picker.grep({
              prompt = ("[%s]: "):format(dir or "cwd"),
              -- prompt = "Enter grep word (target: dir): ",
              dirs = (dir and dir ~= "") and { dir } or nil,
              live = true, -- リアルタイム検索
            })
          end)
        end,
        desc = "Grep with directory selection",
      },
      -- my custom
      {
        "sb",
        function()
          Snacks.picker.buffers()
        end,
        desc = "Buffers",
      },
      {
        "sg",
        function()
          Snacks.picker.grep()
        end,
        desc = "Grep",
      },
      {
        "<leader><space>",
        function()
          Snacks.picker.explorer({
            focus = "input",
          })
        end,
        desc = "Find Files",
      },
      {
        "sf",
        function()
          Snacks.picker.explorer({})
        end,
        desc = "Find Files",
      },
      {
        "<leader>fr",
        function()
          Snacks.picker.recent()
        end,
        desc = "Recent",
      },
      {
        "gb",
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = "Grep Open Buffers",
      },
      -- git
      {
        "<leader>gc",
        function()
          Snacks.picker.git_log()
        end,
        desc = "Git Log",
      },
      {
        "<leader>gs",
        function()
          Snacks.picker.git_status()
        end,
        desc = "Git Status",
      },
      -- Grep
      {
        "<leader>sB",
        function()
          Snacks.picker.lines()
        end,
        desc = "Buffer Lines",
      },
      {
        "<leader>sb",
        function()
          Snacks.picker.grep_buffers()
        end,
        desc = "Grep Open Buffers",
      },
      -- {
      --   "<leader>sg",
      --   function()
      --     Snacks.picker.grep()
      --   end,
      --   desc = "Grep",
      -- },
      {
        "<leader>sw",
        function()
          Snacks.picker.grep_word()
        end,
        desc = "Visual selection or word",
        mode = { "n", "x" },
      },
      -- search
      {
        '<leader>s"',
        function()
          Snacks.picker.registers()
        end,
        desc = "Registers",
      },
      {
        "<leader>sa",
        function()
          Snacks.picker.autocmds()
        end,
        desc = "Autocmds",
      },
      {
        "<leader>sc",
        function()
          Snacks.picker.command_history()
        end,
        desc = "Command History",
      },
      {
        "<leader>sC",
        function()
          Snacks.picker.commands()
        end,
        desc = "Commands",
      },
      {
        "<leader>sd",
        function()
          Snacks.picker.diagnostics()
        end,
        desc = "Diagnostics",
      },
      {
        "<leader>sh",
        function()
          Snacks.picker.help()
        end,
        desc = "Help Pages",
      },
      {
        "<leader>sH",
        function()
          Snacks.picker.highlights()
        end,
        desc = "Highlights",
      },
      {
        "<leader>sj",
        function()
          Snacks.picker.jumps()
        end,
        desc = "Jumps",
      },
      {
        "<leader>sk",
        function()
          Snacks.picker.keymaps()
        end,
        desc = "Keymaps",
      },
      {
        "<leader>sl",
        function()
          Snacks.picker.loclist()
        end,
        desc = "Location List",
      },
      {
        "<leader>sM",
        function()
          Snacks.picker.man()
        end,
        desc = "Man Pages",
      },
      {
        "<leader>sm",
        function()
          Snacks.picker.marks()
        end,
        desc = "Marks",
      },
      {
        "<leader>sR",
        function()
          Snacks.picker.resume()
        end,
        desc = "Resume",
      },
      {
        "<leader>sq",
        function()
          Snacks.picker.qflist()
        end,
        desc = "Quickfix List",
      },
      {
        "<leader>uC",
        function()
          Snacks.picker.colorschemes()
        end,
        desc = "Colorschemes",
      },
      {
        "<leader>qp",
        function()
          Snacks.picker.projects()
        end,
        desc = "Projects",
      },
      -- LSP
      {
        "gd",
        function()
          Snacks.picker.lsp_definitions()
        end,
        desc = "Goto Definition",
      },
      {
        "gr",
        function()
          Snacks.picker.lsp_references()
        end,
        nowait = true,
        desc = "References",
      },
      {
        "gI",
        function()
          Snacks.picker.lsp_implementations()
        end,
        desc = "Goto Implementation",
      },
      {
        "gy",
        function()
          Snacks.picker.lsp_type_definitions()
        end,
        desc = "Goto T[y]pe Definition",
      },
      {
        "<leader>ss",
        function()
          Snacks.picker.lsp_symbols()
        end,
        desc = "LSP Symbols",
      },
    },
  },
}
