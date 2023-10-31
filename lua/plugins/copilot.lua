require("config.osKeyMap").setup()

local osKeyMap = require("config.osKeyMap").mapping

return {
  "zbirenbaum/copilot.lua",
  event = "InsertEnter",
  opts = {
    suggestion = {
      enabled = true,
      auto_trigger = true,
      keymap = {
        accept = osKeyMap.OPT_l,
        accept_word = false,
        accept_line = false,
        next = osKeyMap.OPT_BRACKET_RIGHT,
        prev = osKeyMap.OPT_BRACKET_LEFT,
        dismiss = "<C-]>",
      },
    },
    panel = {
      enabled = true,
      auto_refresh = true,
      keymap = { open = osKeyMap.OPT_p },
    },
    filetypes = {
      markdown = true,
      help = true,
    },
  },
}
