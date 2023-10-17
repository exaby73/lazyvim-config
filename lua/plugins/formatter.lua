return {
  "stevearc/conform.nvim",
  keys = {
    {
      "<leader>cS",
      "<cmd>noautocmd w<cr>",
      desc = "Save without formatting",
    },
  },
  formatters_by_ft = {
    astro = { "prettierd", "prettier" },
  },
}
