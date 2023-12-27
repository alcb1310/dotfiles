local opts = {
    ensure_installed = {
        "lua_ls",
        "efm",
    },
    automatic_installation = true,
}

return {
    "williamboman/mason-lspconfig.nvim",
    opts = opts,
    event = "BufReadPre",
    dependencies = { "williamboman/mason.nvim", "neovim/nvim-lspconfig" },
}
