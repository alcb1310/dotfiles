return {
  "nvimtools/none-ls.nvim",
  dependencies = {
    "nvimtools/none-ls-extras.nvim",
  },
  event = { "BufReadPost", "BufNewFile" },
  config = function()
    local null_ls = require("null-ls")
    null_ls.setup({
      sources = {
        null_ls.builtins.formatting.stylua,

        null_ls.builtins.formatting.gofumpt,
        null_ls.builtins.formatting.goimports_reviser,
        null_ls.builtins.formatting.prettierd,

        null_ls.builtins.diagnostics.golangci_lint,
        require("none-ls.code_actions.eslint"),
        -- require("none-ls.diagnostics.eslint_d"),
      },
    })

    vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
  end,
}
