return {
  "lewis6991/gitsigns.nvim",
  opts = {
    signs = {
      add = "", -- NOTE: you can set any of these to an empty string to not show them
      delete = "✖",
      topdelete = { text = "" },
      changedelete = { text = "▎" },
      change = "✹",
      renamed = "",
      -- Status type
      untracked = "✭",
      ignored = "",
      -- unstaged = "",
      unstaged = "",
      staged = "✔︎",
      conflict = "",
    },
  },
}
