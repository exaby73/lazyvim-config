return {
  "nvim-tree/nvim-tree.lua",
  cmd = { "NvimTreeToggle", "NvimTreeFocus" },
  opts = function()
    return require "nvchad.configs.nvimtree"
  end,
  config = function(_, opts)
    dofile(vim.g.base46_cache .. "nvimtree")
    require("nvim-tree").setup {
      on_attach = function()
        local nvimtreeapi = require "nvim-tree.api"

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

        vim.keymap.set("n", "e", edit_or_open, { desc = "Edit Or Open" })
      end,
    }
  end,
}
