return {
  {
    "L3MON4D3/LuaSnip",
    -- follow latest release.
    version = "v2.*", -- Replace <CurrentMajor> by the latest released major (first number of latest release)
    -- install jsregexp (optional!).
    build = "make install_jsregexp",
    config = function()
      local ls = require "luasnip"

      -- set keybinds for both INSERT and VISUAL.
      vim.api.nvim_set_keymap("i", "<C-n>", "<Plug>luasnip-next-choice", {})
      vim.api.nvim_set_keymap("s", "<C-n>", "<Plug>luasnip-next-choice", {})
      vim.api.nvim_set_keymap("i", "<C-p>", "<Plug>luasnip-prev-choice", {})
      vim.api.nvim_set_keymap("s", "<C-p>", "<Plug>luasnip-prev-choice", {})

      ls.add_snippets("dart", require "configs.snippets.dart_snippets")
    end,
  },
}
