local on_attach = require("util.lsp").on_attach

local config = function()
	require("neoconf").setup({})

	local cmp_nvim_lsp = require("cmp_nvim_lsp")
	local lspconfig = require("lspconfig")

	local signs = {
		{ name = "DiagnosticSignError", text = "" },
		{ name = "DiagnosticSignWarn", text = "" },
		{ name = "DiagnosticSignHint", text = "" },
		{ name = "DiagnosticSignInfo", text = "" },
	}

	for _, sign in ipairs(signs) do
		vim.fn.sign_define(sign.name, { texthl = sign.name, text = sign.text, numhl = "" })
	end

	local capabilities = cmp_nvim_lsp.default_capabilities()

	-- lua
	lspconfig.lua_ls.setup({
		capabilities = capabilities,
		on_attach = on_attach,
		settings = {
			Lua = {
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					library = {
						[vim.fn.expand("$VIMRUNTIME/lua")] = true,
						[vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	-- go
	lspconfig.gopls.setup({
		cmd = { "gopls", "serve" },
		filetypes = { "go", "gomod" },
		root_dir = require("lspconfig").util.root_pattern("go.work", "go.mod", ".git"),
		settings = {
			gopls = {
				analyses = {
					unusedparams = true,
				},
				staticcheck = true,
			},
		},
		on_attach = on_attach,
		capabilities = capabilities,
	})

	-- typescript
	lspconfig.tsserver.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = {
			"javascript",
			"javascriptreact",
			"javascript.jsx",
			"typescript",
			"typescriptreact",
			"typescript.tsx",
		},
		root_dir = lspconfig.util.root_pattern("package.json", "tsconfig.json", ".git"),
	})

	-- tailwind
	lspconfig.tailwindcss.setup({
		filetypes = { "html", "css", "scss", "javascript", "javascriptreact", "typescript", "typescriptreact", "templ" },
		init_options = {
			userLanguages = {
				templ = "html",
			},
		},
	})

	-- sql
	lspconfig.sqlls.setup({
		on_attach = on_attach,
		capabilities = capabilities,
		filetypes = { "sql" },
	})

    -- clangd
    lspconfig.clangd.setup({
        on_attach = on_attach,
        capabilities = capabilities,
        filetypes = { "c", "cpp", "objc", "objcpp" },
    })

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")
	-- local goimports = require("efmls-configs.linters.goimports-reviser")
	local gofumpt = require("efmls-configs.formatters.gofumpt")
	local eslintd = require("efmls-configs.linters.eslint_d")
	local prettierd = require("efmls-configs.formatters.prettier_d")
	local sqlfluff = require("efmls-configs.linters.sqlfluff")
	-- local sqlfmt = require("efmls-configs.formatters.sqlfmt")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
			"go",
			"typescript",
			"sql",
		},
		init_options = {
			documentFormatting = true,
			documentRangeFormatting = true,
			hover = true,
			documentSymbol = true,
			codeAction = true,
			completion = true,
		},
		settings = {
			languages = {
				lua = { luacheck, stylua },
				go = { gofumpt },
				typescript = { eslintd, prettierd },
				sql = {
                    sqlfluff,
                    -- sqlfmt
                },
			},
		},
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"williamboman/mason.nvim",
		"williamboman/mason-lspconfig.nvim",
		"creativenull/efmls-configs-nvim",
	},
}
