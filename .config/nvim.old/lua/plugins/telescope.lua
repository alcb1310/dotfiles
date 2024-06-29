local ignore_patterns = {
    "%_templ.go",
}

return {
    {
        "nvim-telescope/telescope.nvim",

        tag = "0.1.6",
        lazy = false,
        opts = {
            defaults = {
                layout_config = {
                    prompt_position = "top",
                },
                file_ignore_patterns = ignore_patterns
            },
        },
        config = function(_, opts)
            require("telescope").load_extension("ui-select")
            require("telescope").setup(opts)
        end,
        dependencies = {
            {
                "nvim-lua/plenary.nvim",
            },
        },
    },
    {
        "nvim-telescope/telescope-ui-select.nvim",
    },
}
