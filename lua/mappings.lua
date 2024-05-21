require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })

-- Format

-- Map to Option + l
map("n", "¬", function()
  require("conform").format { async = true, lsp_fallback = true }
end, { desc = "Format Files" })

-- End Format

-- Toggleable terminals

-- Map to Option + Shift + V
map({ "n", "t" }, "◊", function()
  require("nvchad.term").toggle { pos = "vsp", id = "vtoggleTerm", size = 0.3 }
end, { desc = "Terminal Toggleable vertical term" })

-- Map to Option + Shift + H
map({ "n", "t" }, "Ó", function()
  require("nvchad.term").toggle { pos = "sp", id = "htoggleTerm", size = 0.3 }
end, { desc = "Terminal New horizontal term" })

-- Map to Option + Shift + I
map({ "n", "t" }, "ˆ", function()
  require("nvchad.term").toggle { pos = "float", id = "floatTerm" }
end, { desc = "Terminal Toggle Floating term" })

map("t", "<ESC>", function()
  local win = vim.api.nvim_get_current_win()
  vim.api.nvim_win_close(win, true)
end, { desc = "Terminal Close term in terminal mode" })

-- End Toggleable terminals

-- Tabufline

map("n", "<tab>", function()
  require("nvchad.tabufline").next()
end, { desc = "Buffer Goto next" })

map("n", "<S-tab>", function()
  require("nvchad.tabufline").prev()
end, { desc = "Buffer Goto prev" })

-- End Tabufline

-- Resize splits

-- Map to Option + Shift + J
map("n", "Ô", "<cmd>resize +2<CR>", { desc = "Resize -2" })

-- Map to Option + Shift + K
map("n", "", "<cmd>resize -2<CR>", { desc = "Resize +2" })

-- Map to Option + Shift + L
map("n", "Ò", "<cmd>vertical resize +2<CR>", { desc = "Vertical Resize +2" })

-- Map to Option + Shift + H
map("n", "Ó", "<cmd>vertical resize -2<CR>", { desc = "Vertical Resize -2" })

-- End Resize splits

-- Genral mappings

-- Paste replacement
map("v", "gr", '"_dP', { desc = "Paste replace" })

-- End Genral mappings
