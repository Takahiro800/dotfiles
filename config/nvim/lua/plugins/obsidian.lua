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
        path = "~/git/notes",
        strict = true,
      },
    },
    daily_notes = {
      folder = "02_Daily",
      date_format = "%Y-%m-%d",
      alias_format = "%Y-%m-%d",
      template = "daily_template",
    },
    completion = {
      nvim_cmp = true,
      min_chars = 2,
    },
    ui = {
      enable = true,
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
    { "<leader>zt", "<cmd>ObsidianToday<cr>", desc = "Obsidian Today daily note" },
  },
}
