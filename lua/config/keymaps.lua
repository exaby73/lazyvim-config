-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local lazyUtil = require("lazyvim.util")

local opts = { noremap = true, silent = true }
local keymap = vim.keymap.set

-- Keep cursor in the same place for yank
keymap("v", "y", "ygv<Esc>", opts)

-- Floating terminal remaps
local lazyterm = function()
  lazyUtil.terminal(nil, { cwd = lazyUtil.root() })
end

keymap("n", "<c-_>", function()
  lazyUtil.terminal()
end, { desc = "Toggle terminal (cwd)" })

keymap("n", "<leader>fT", lazyterm, { desc = "Terminal (root dir)" })
