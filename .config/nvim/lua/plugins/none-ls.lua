return {
  "nvimtools/none-ls.nvim",
  event = "InsertEnter",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  config = function()
    local null_ls = require("null-ls")

    null_ls.setup({
      sources = {
        --        null_ls.builtins.formatting.stylua,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.gofmt,
        null_ls.builtins.formatting.prettierd.with({
          extra_filetypes = { "astro" },
        }),

        null_ls.builtins.completion.luasnip,

        null_ls.builtins.diagnostics.dotenv_linter,
      },
    })
  end,
}
