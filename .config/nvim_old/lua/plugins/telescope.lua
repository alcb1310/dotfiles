local k = vim.keymap.set

return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.5",
        -- or branch = '0.1.x',
        dependencies = {
            "nvim-lua/plenary.nvim",
        },
        lazy = false,
        command= "Telescope",
        opts = {
            defaults = {
                file_ignore_patterns = { ".git/", "node_modules/" },
                layout_config = {
                    prompt_position = "top",
                    height = 0.90,
                    width = 0.90,
                    preview_cutoff = 0,
                    horizontal = { preview_width = 0.60 },
                    vertical = { width = 0.55, height = 0.9, preview_cutoff = 0 },
                },
            },
            pickers = {
                find_files = {
                    find_command = { "fd", "-H" },
                },
                git_files = {
                    show_untracked = true,
                },
            },
            extensions = {
                ["ui-select"] = {
                    require("telescope.themes").get_dropdown({}),
                },
            },
        },
        config = function(_, opts)
            require("telescope").load_extension("ui-select")

            local telescope = require("telescope")
            local builtin = require("telescope.builtin")

            telescope.setup(opts)

            vim.keymap.set("n", "<leader>ff", builtin.find_files)
            vim.keymap.set("n", "<leader>fg", builtin.live_grep)
            vim.keymap.set("n", "<leader>fb", builtin.buffers)
            vim.keymap.set("n", "<C-g>", builtin.git_files)
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
}
