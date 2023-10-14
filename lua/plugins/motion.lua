return {
  {
    "bkad/CamelCaseMotion",
    config = function()
      local remap = vim.keymap.set
      local options = { silent = true }

      remap("", "w", "<Plug>CamelCaseMotion_w", options)
      remap("", "b", "<Plug>CamelCaseMotion_b", options)
      remap("", "e", "<Plug>CamelCaseMotion_e", options)
      remap("", "ge", "<Plug>CamelCaseMotion_ge", options)
      vim.cmd("sunmap b")
      vim.cmd("sunmap e")
      vim.cmd("sunmap ge")
    end,
  },
}
