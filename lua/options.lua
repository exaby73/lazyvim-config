require "nvchad.options"

-- add yours here!

local o = vim.opt

o.clipboard = "" -- Don't copy into clipboard
o.exrc = true -- load .nvim.lua
o.scrolloff = 6
o.termguicolors = true
o.relativenumber = true

local group = vim.api.nvim_create_augroup("FormatAutoGroup", {})

vim.api.nvim_create_autocmd(
  "FocusLost",
  { command = 'silent! lua require("conform").format { lsp_fallback = true }', group = group }
)
vim.api.nvim_create_autocmd("FocusLost", { command = "silent! wa", group = group })
