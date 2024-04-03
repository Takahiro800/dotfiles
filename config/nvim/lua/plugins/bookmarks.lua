return {
  {
    "LintaoAmons/bookmarks.nvim",
    dependencies = {
      { "stevearc/dressing.nvim" }, -- optional: to have the same UI shown in the GIF
    },
    keys = {
      { "mm", "<Cmd>BookmarksMark<CR>", desc = "bookmark current line" },
      { "mg", "<Cmd>BookmarksGoto<CR>", desc = "Go to bookmark at current bookmark list" },
      { "mc", "<Cmd>BookmarksCommands<CR>", desc = "Find and trigger a bookmark command." },
      { "mr", "<Cmd>BookmarksRecent<CR>", desc = "Go to latest visited/created Bookmark" },
    },
  },
}
