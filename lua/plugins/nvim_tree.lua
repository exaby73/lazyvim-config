local tables = require "utils.tables"

return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  opts = function()
    return require "nvchad.configs.nvimtree"
  end,
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "nvimtree")
    opts["on_attach"] = function(bufnr)
      local nvimtreeapi = require "nvim-tree.api"

      nvimtreeapi.config.mappings.default_on_attach(bufnr)

      local function edit_or_open()
        local node = nvimtreeapi.tree.get_node_under_cursor()

        if node.nodes ~= nil then
          -- expand or collapse folder
          nvimtreeapi.node.open.edit()
        else
          -- open file
          nvimtreeapi.node.open.edit()
          -- Close the tree if file was opened
          nvimtreeapi.tree.close()
        end
      end

      local function make_opts(desc)
        return { desc = desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      vim.keymap.set("n", "e", edit_or_open, make_opts "Edit file or open folder")
    end

    require("nvim-tree").setup(opts)
  end,
}
