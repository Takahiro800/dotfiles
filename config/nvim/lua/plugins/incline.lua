return {
  "b0o/incline.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  event = "BufReadPre",
  priority = 1200,
  config = function()
    -- local colors = require("gruvbox-material").setup()
    require("incline").setup({
      -- highlight = {
      --   groups = {
      --     InclineNormal = { guibg = colors.magenta500, guifg = colors.base04 },
      --     InclineNormalNC = { guifg = colors.violet500, guibg = colors.base03 },
      --   },
      -- },
      -- window = { margin = { vertical = 0, horizontal = 1 } },
      -- hide = {
      --   cursorline = true,
      -- },
      render = function(props)
        local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
        if vim.bo[props.buf].modified then
          filename = "[+] " .. filename
        end

        ---------------------------------------------------------------------
        local devicons = require("nvim-web-devicons")
        local ft_icon, ft_color = devicons.get_icon_color(filename)

        local function get_git_diff()
          local icons = { removed = " ", changed = " ", added = " " }
          local signs = vim.b[props.buf].gitsigns_status_dict
          local labels = {}
          if signs == nil then
            return labels
          end
          for name, icon in pairs(icons) do
            if tonumber(signs[name]) and signs[name] > 0 then
              table.insert(labels, { icon .. signs[name] .. " ", group = "Diff" .. name })
            end
          end
          if #labels > 0 then
            table.insert(labels, { "┊ " })
          end
          return labels
        end
        local function get_diagnostic_label()
          local icons = { error = " ", warn = " ", info = " ", hint = " " }
          local label = {}

          for severity, icon in pairs(icons) do
            local n = #vim.diagnostic.get(props.buf, { severity = vim.diagnostic.severity[string.upper(severity)] })
            if n > 0 then
              table.insert(label, { icon .. n .. " ", group = "DiagnosticSign" .. severity })
            end
          end
          if #label > 0 then
            table.insert(label, { "┊ " })
          end
          return label
        end

        return {
          { get_diagnostic_label() },
          { get_git_diff() },
          { (ft_icon or " ") .. " ", guifg = ft_color, guibg = "none" },
          { filename .. " ", gui = vim.bo[props.buf].modified and "bold,italic" or "bold" },
          -- { "┊  " .. vim.api.nvim_win_get_number(props.win), group = "DevIconWindows" },
        }
        ---------------------------------------------------------------------

        -- local icon, color = require("nvim-web-devicons").get_icon_color(filename)
        -- return { { icon, guifg = color }, { " " }, { filename } }
      end,
    })
  end,
}
