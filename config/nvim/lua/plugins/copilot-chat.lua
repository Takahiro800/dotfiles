return {
  {
    "CopilotC-Nvim/CopilotChat.nvim",
    branch = "canary",
    dependencies = {
      { "zbirenbaum/copilot.lua" },
      { "nvim-lua/plenary.nvim" },
    },
    opts = function()
      local select = require("CopilotChat.select")

      return {
        debug = true,
        window = {
          layout = "horizontal",
          width = 0.5,
          height = 0.5,
          -- Options below only apply to floating windows
          relative = "editor",
          border = "single",
          row = nil,
          col = nil,
          title = "Copilot Chat",
          footer = nil,
          zindex = 1,
        },
        selection = function(source)
          return select.visual(source) or select.buffer(source)
        end,
        prompts = {
          Explain = {
            prompt = "/COPILOT_EXPLAIN 選択したコードの説明を段落をつけて書いてください。",
            -- selection = select.selection or function()
            selection = select.visual or select.buffer
          },
          Fix = {
            prompt = "/COPILOT_FIX このコードには問題があります。バグを修正したコードに書き換えてください。",
            selection = select.selection or function()
              return {}
            end,
          },
          Optimize = {
            prompt = "/COPILOT_OPTIMIZE 選択したコードを最適化し、パフォーマンスと可読性を向上させてください。",
            selection = select.selection or function()
              return {}
            end,
          },
          Tests = {
            prompt = "/COPILOT_TESTS 選択したコードの詳細な単体テスト関数を書いてください。",
            selection = select.selection or function()
              return {}
            end,
          },
          FixDiagnostic = {
            prompt = "/COPILOT_FIXDIAGNOSTIC ファイル内の次のような診断上の問題を解決してください：",
            selection = select.diagnostics or select.selection or function()
              return {}
            end,
          },
          Commit = {
            prompt = "/COPILOT_COMMIT この変更をコミットしてください。",
            selection = select.gitdiff or select.selection or function()
              return {}
            end,
          },
          CommitStaged = {
            prompt = "/COPILOT_COMMITSTAGED ステージングされた変更をコミットしてください。",
            selection = select.selection or function()
              return {}
            end,
          },
        },
      }
    end,
    keys = {
      { "<leader>ct", ":CopilotChatToggle<cr>", "Copilot Chat" },
    },
  },
}
