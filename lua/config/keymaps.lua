-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require("config.osKeyMap").setup()
local map = require("config.osKeyMap").mapping
local lazyUtil = require("lazyvim.util")

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

keymap("n", map.OPT_BACKSLASH, "<cmd>FlutterReload<cr>", opts)
keymap("n", map.OPT_SHIFT_BACKSLASH, "<cmd>FlutterRestart<cr>", opts)

-- Keep cursor in the same place for yank
keymap("v", "y", "ygv<Esc>", opts)

-- Flutter
keymap("n", "<leader>fs", ":FlutterRun<CR>", opts)
keymap("n", "<leader>fo", ":FlutterOutlineToggle<CR>", opts)
keymap("n", "<leader>fd", ":FlutterDevices<CR>", opts)
keymap("n", "<leader>fe", ":FlutterEmulators<CR>", opts)
keymap("n", "<leader>ft", ":FlutterOpenDevTools<CR>", opts)
keymap("n", "<leader>fr", ":FlutterReload<CR>", opts)
keymap("n", "<leader>fR", ":FlutterRestart<CR>", opts)

local lazyterm = function()
  lazyUtil.terminal(nil, { cwd = lazyUtil.root() })
end
keymap("n", "<c-_>", function()
  lazyUtil.terminal()
end, { desc = "Toggle terminal (cwd)" })
keymap("n", "<leader>fT", lazyterm, { desc = "Terminal (root dir)" })
