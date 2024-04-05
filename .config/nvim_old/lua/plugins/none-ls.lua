-- NOTE: Remember when creating an Astro project that you should always install the prettier-plugin-astro and prettier dev dependencies to it

return {
    "nvimtools/none-ls.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
    event = { "BufReadPost", "BufNewFile" },
    config = function()
        local null_ls = require("null-ls")

        null_ls.setup({
            sources = {
                null_ls.builtins.formatting.stylua,
                null_ls.builtins.formatting.goimports_reviser,
                null_ls.builtins.formatting.gofmt,
                null_ls.builtins.formatting.prettierd.with({
                    extra_filetypes = { "astro" },
                }),
            },
        })

        vim.keymap.set("n", "<leader>f", vim.lsp.buf.format, {})
    end,
}
