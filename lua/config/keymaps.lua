-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

require("config.osKeyMap").setup()

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set
local map = require("config.osKeyMap").mapping

keymap("n", map.OPT_BACKSLASH, "<cmd>FlutterReload<cr>", opts)
keymap("n", map.OPT_SHIFT_BACKSLASH, "<cmd>FlutterRestart<cr>", opts)

-- Keep cursor in the same place for yank
keymap("v", "y", "ygv<Esc>", opts)

-- Indent Selected Lines
keymap("v", ">", ">gv", opts)
keymap("v", "<", "<gv", opts)
