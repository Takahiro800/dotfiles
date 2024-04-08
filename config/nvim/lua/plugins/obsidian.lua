return {
  "epwalsh/obsidian.nvim",
  version = "*", -- recommended, use latest release instead of latest commit
  lazy = true,
  ft = "markdown",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {
    workspaces = {
      {
        name = "personal",
        path = "~/git/note",
        strict = true,
      },
    },
    daily_notes = {
      folder = "02_Daily",
      date_format = "%Y-%m-%d",
      alias_format = "%B %-d, %Y",
      template = nil,
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    ui = {
      enable = false,
    },

    notes_subdir = "00_Inbox",
    new_notes_location = "notes_subdir",

    note_id_func = function(title)
      local file_name
      if title ~= nil then
        file_name = title:gsub(" ", "-"):gsub("[^A-Za-z0-9-]", ""):lower()
      else
        file_name = tostring(os.time())
      end
      return file_name
    end,

    preferred_link_style = "wiki",

    templates = {
      subdir = "99_templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M",
    },
  },
  keys = {
    { "<leader>zn", "<cmd>ObsidianNew<cr>", desc = "Obsidian new note" },
  },
}
