return {
  "sainnhe/gruvbox-material",
  priority = 1000,
  config = function()
    vim.g.gruvbox_material_enable_italic = 1
    vim.g.gruvbox_material_background = "hard"
    vim.cmd([[colorscheme gruvbox-material]])
  end,
}
