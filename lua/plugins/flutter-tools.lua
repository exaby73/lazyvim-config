require("configs.os_key_map").setup()
local map = require("configs.os_key_map").mapping

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
    vim.cmd [[
       " Show hover
       nnoremap K <Cmd>lua vim.lsp.buf.hover()<CR>
       " Jump to definition
       nnoremap gd <Cmd>lua vim.lsp.buf.definition()<CR>
       " Open code actions using the default lsp UI, if you want to change this please see the plugins above
       nnoremap <leader>ca <Cmd>lua vim.lsp.buf.code_action()<CR>
       " Open code actions for the selected visual range
       xnoremap <leader>ca <Cmd>lua vim.lsp.buf.range_code_action()<CR>
      ]]
    require("flutter-tools").setup {
      fvm = true,
      widget_guides = {
        enabled = true,
      },
      lsp = {
        settings = {
          dart = {
            lineLength = 100,
          },
        },
      },
    }
  end,
}
