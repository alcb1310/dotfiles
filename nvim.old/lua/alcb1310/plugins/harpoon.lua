local M = {
     "theprimeagen/harpoon",
     branch = "harpoon2",
     config = function()
          local harpoon = require("harpoon")
          -- local ui = require("harpoon.ui")
          harpoon:setup()

          vim.keymap.set("n", "<leader>a", function() harpoon:list():append() end)
          vim.keymap.set("n", "<C-e>", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

          vim.keymap.set("n", "<leader>h", function() harpoon:list():select(1) end)
          vim.keymap.set("n", "<leader>e", function() harpoon:list():select(2) end)
          vim.keymap.set("n", "<leader>y", function() harpoon:list():select(3) end)
          vim.keymap.set("n", "<leader>t", function() harpoon:list():select(4) end)
     end,
     lazy = true,
     keys = {
          "<leader>a",
          "<C-e>",
          "<leader>h",
          "<leader>e",
          "<leader>y",
          "<leader>t",
     }
}

return M
