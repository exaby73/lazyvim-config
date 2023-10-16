require("config.osKeyMap").setup()
local map = require("config.osKeyMap").mapping

return {
  "akinsho/flutter-tools.nvim",
  lazy = false,
  keys = {
    {
      "<leader>fs",
      "<cmd>FlutterRun<cr>",
      desc = "Start Flutter",
    },
    {
      "<leader>fd",
      "<cmd>FlutterOpenDevTools<CR>",
      desc = "Open Flutter Devtools",
    },
    {
      "<leader>fr",
      "<cmd>FlutterReload<CR>",
      desc = "Hot Reload Flutter",
    },
    {
      map.OPT_BACKSLASH,
      "<cmd>FlutterReload<cr>",
      desc = "Hot Reload Flutter",
    },
    {
      "<leader>fR",
      "<cmd>FlutterRestart<CR>",
      desc = "Hot Restart Flutter",
    },
    {
      map.OPT_SHIFT_BACKSLASH,
      "<cmd>FlutterRestart<cr>",
      desc = "Hot Restart Flutter",
    },

    {
      "<leader>fq",
      "<cmd>FlutterQuit<CR>",
      desc = "Quit Flutter",
    },
  },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "stevearc/dressing.nvim", -- optional for vim.ui.select
  },
  config = function()
    require("flutter-tools").setup({
      fvm = true,
      widget_guides = {
        enabled = true,
      },
    })
  end,
}
