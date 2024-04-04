local servers = {
  "lua_ls",
  "gopls",
  "tsserver",
  "htmx",
  "tailwindcss",
  "astro",
  "volar",
}

local on_attach = function(client, bufnr)
  local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

  if client.supports_method("textDocument/formatting") then
    vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
    vim.api.nvim_create_autocmd("BufWritePre", {
      group = augroup,
      buffer = bufnr,
      callback = function()
        vim.lsp.buf.format({ bufnr = bufnr })
      end,
    })
  end
end

return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local capabilities = require("cmp_nvim_lsp").default_capabilities()
    local lspconfig = require("lspconfig")

    for _, lsp in ipairs(servers) do
      lspconfig[lsp].setup({
        capabilities = capabilities,
        on_attach = on_attach,
      })
    end

    lspconfig.tailwindcss.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = {
        "html",
        "css",
        "scss",
        "javascript",
        "javascriptreact",
        "typescriptreact",
        "svelte",
        "vue",
        "templ",
      },
      init_options = {
        userLanguages = {
          templ = "html",
        },
      },
    })

    lspconfig.tsserver.setup({
      capabilities = capabilities,
      on_attach = on_attach,
      filetypes = { "javascript", "typescript", "typescriptreact", "javascriptreact", "svelte", "vue", "templ" },
      init_options = {
        plugins = {
          {
            name = "@vue/typescript-plugin",
            location = "/opt/homebrew/lib/node_modules/@vue/typescript-plugin",
            languages = { "javascript", "typescript", "vue" },
          }
        }
      }
    })

    vim.filetype.add({ extension = { templ = "templ" } })

    vim.keymap.set("n", "gD", vim.lsp.buf.declaration, { desc = "Go to declaration" })
    vim.keymap.set("n", "gd", vim.lsp.buf.definition, { desc = "Go to definition" })
    vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
    vim.keymap.set("n", "<leader>gi", vim.lsp.buf.implementation, { desc = "Go to implementation" })
    vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, { desc = "Get signature help" })
    vim.keymap.set("n", "<leader>wa", vim.lsp.buf.add_workspace_folder, {})
    vim.keymap.set("n", "<leader>wr", vim.lsp.buf.remove_workspace_folder, {})
    vim.keymap.set("n", "<leader>wl", function()
      print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
    end, {})
    vim.keymap.set("n", "<leader>D", vim.lsp.buf.type_definition, {})
    vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, { desc = "Rename" })
    vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, { desc = "Show code actions" })
    vim.keymap.set("n", "gr", vim.lsp.buf.references, { desc = "Go to references" })
  end,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
    {
      "williamboman/mason-lspconfig.nvim",
      config = function()
        require("mason-lspconfig").setup({
          ensure_installed = servers,
        })
      end,
    },
    {
      "williamboman/mason.nvim",
      cmd = "Mason",
      config = function()
        require("mason").setup()
      end,
    },
  },
}
