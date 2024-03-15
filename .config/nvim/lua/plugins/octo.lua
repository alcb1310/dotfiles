local k = vim.keymap.set

return {
    "pwntester/octo.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
        "nvim-telescope/telescope.nvim",
        "nvim-tree/nvim-web-devicons",
    },
    config = function()
        require("octo").setup()

        k("n", "<leader>O", ":Octo actions<CR>", { silent = true })
        k("n", "<leader>prl", ":Octo pr list<CR>", { silent = true })
        k("n", "<leader>prc", ":Octo pr create<CR>", { silent = true })
        k("n", "<leader>gil", ":Octo issue list<CR>", { silent = true })
        k("n", "<leader>gic", ":Octo issue create<CR>", { silent = true })
    end,
}
