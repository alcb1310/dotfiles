local k = vim.keymap.set

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        -- or branch = '0.1.x',
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        config = function()
            local builtin = require("telescope.builtin")

            k("n", "<leader>ff", builtin.find_files)
            k("n", "<leader>fg", builtin.live_grep)
            k("n", "<leader>fb", builtin.buffers)
            k("n", "<C-g>", builtin.git_files)
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
        config = function()
            require("telescope").setup({
                extensions = {
                    ["ui-select"] = {
                        require("telescope.themes").get_dropdown({}),
                    },
                },
            })
            require("telescope").load_extension("ui-select")
        end,
    },
}
