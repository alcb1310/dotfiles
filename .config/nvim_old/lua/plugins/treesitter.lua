return {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    config = function()
        require("nvim-treesitter.configs").setup({
            ensure_installed = {
                "lua",
                "vim",
                "vimdoc",
                "javascript",
                "html",
                "typescript",
                "go",
                "gomod",
                "gosum",
                "templ",
                "json",
                "http",
            },
            auto_install = true,
            highlight = { enable = true },
            indent = { enable = true },
        })
    end,
}
