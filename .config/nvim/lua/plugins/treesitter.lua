return {
    "nvim-treesitter/nvim-treesitter",
    lazy = false,
    build = ":TSUpdate",
    opts = {
        -- A list of parser names, or "all" (the five listed parsers should always be installed)
        ensure_installed = {
            "lua",
            "vim",
            "vimdoc",
            "json",
            "http",
        },

        -- Install parsers synchronously (only applied to `ensure_installed`)
        sync_install = false,
        auto_install = true,

        highlight = {
            enable = true,
        },
    },
    config = function(_, opts)
        require("nvim-treesitter.configs").setup(opts)
    end,
}
