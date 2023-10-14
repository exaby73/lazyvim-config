return {
  "nvim-neo-tree/neo-tree.nvim",

  config = function()
    require("neo-tree").setup({
      close_if_last_window = true,
      window = {
        position = "left",
        mappings = {
          ["e"] = { "toggle_node", nowait = false },
          ["o"] = { "open", nowait = false },
        },
      },
      filesystem = {
        use_libuv_file_watcher = true,
        filtered_items = {
          hide_dotfiles = false,
          hide_gitignored = false,
          hide_by_name = {
            ".git",
            ".DS_Store",
            "thumbs.db",
          },
        },
      },
      default_component_configs = {
        git_status = {
          symbols = {
            -- Change type
            added = "", -- NOTE: you can set any of these to an empty string to not show them
            deleted = "✖",
            modified = "✹",
            renamed = "",
            -- Status type
            untracked = "✭",
            ignored = "",
            -- unstaged = "",
            unstaged = "",
            staged = "✔︎",
            conflict = "",
          },
          align = "right",
        },
      },
    })
  end,
}
