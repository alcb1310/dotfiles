return {
    "nvimtools/none-ls.nvim",
    dependencies = {
        "nvim-lua/plenary.nvim",
    },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.completion.spell,
                -- require("none-ls.diagnostics.eslint"), -- requires none-ls-extras.nvim
                null_ls.builtins.formatting.goimports_reviser,
                null_ls.builtins.formatting.gofumpt,

                null_ls.builtins.completion.luasnip,
                null_ls.builtins.formatting.clang_format,
            },
        })
    end,
}
