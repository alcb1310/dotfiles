return {
     "tpope/vim-fugitive",
     lazy = true,
     keys = {
          "<leader>gs",
     },
     config = function()
          vim.keymap.set("n", "<leader>gs", vim.cmd.Git, { silent = true })
     end,
}
