local M = {
     "tpope/vim-fugitive",
     config = function()
          vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { silent = true })
     end,
     lazy = true,
     keys = {
          "<leader>gs",
     }
}

return M
