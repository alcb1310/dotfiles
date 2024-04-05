return {
    {
        "projekt0n/caret.nvim",
        priority = 1000,
        lazy = false,
        config = function()
            require("caret").setup({
                options = {
                    transparent = true,
                    inverted_signs = false,
                },
            })
            vim.cmd.colorscheme("caret")
        end,
    },
}
