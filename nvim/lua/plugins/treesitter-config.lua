local config = function () 
    require("nvim-treesitter.configs").setup({
        indent = {
            enable = true
        },
        autotag = {
            enable=true,
        },
        ensure_installed = {
            "markdown",
            "json",
            "javascript",
            "typescript",
            "yaml",
            "html",
            "css",
            "bash",
            "lua",
            "gitignore",
            "go",
            "gomod",
            "gosum",
            "http",
            "sql",
        },
        auto_install=true,
        highlight = {
            enable = true,
        }
    })
end

return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    config = config
}
