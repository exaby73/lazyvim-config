local options = {
  formatters_by_ft = {
    lua = { "stylua" },
    css = { "prettier" },
    html = { "prettier" },
    dart = { "dart_format" },
  },

  formatters = {
    dart_format = {
      inherit = false,
      command = "fvm",
      args = { "dart", "format", "--line-length", "100", "--fix", "$FILENAME" },
      stdin = false,
      tmpfile_format = ".conform.$RANDOM.$FILENAME",
    },
  },

  format_after_save = {
    timeout_ms = 1000,
    lsp_fallback = true,
  },
}

require("conform").setup(options)
