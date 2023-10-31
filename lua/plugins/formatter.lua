return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>cS",
      "<cmd>noautocmd w<cr>",
      desc = "Save without formatting",
    },
  },
  opts = {
    formatters = {
      swiftformat = {
        command = "swiftformat",
      },
    },
    formatters_by_ft = {
      astro = { "prettier" },
      css = { "prettier" },
      html = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      svelte = { "prettier" },
      swift = { "swiftformat" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
    },
  },
}
