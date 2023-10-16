-- Options are automatically loaded before lazy.nvim startup
-- Default options that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/options.lua
-- Add any additional options here

vim.opt.exrc = true
vim.opt.clipboard = ""

local group = vim.api.nvim_create_augroup("FormatAutoGroup", {})

vim.api.nvim_create_autocmd("FocusLost", { command = "silent! LazyFormat", group = group })
vim.api.nvim_create_autocmd("FocusLost", { command = "silent! wa", group = group })
