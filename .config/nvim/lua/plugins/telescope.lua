return {
    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim" },
        opts = {
            pickers = {
                colorscheme = {
                    enable_preview = true,
                },
                buffers = {
                    mappings = {
                        i = {
                            ["<c-d>"] = require("telescope.actions").delete_buffer,
                        },
                    },
                },
            },
        },
        config = function(_, opts)
            require("telescope").load_extension("ui-select")
            require("telescope").setup(opts)
        end,
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
    }
}
