local config = function()
	require("neoconf").setup({})

	local lspconfig = require("lspconfig")

	-- enable keybinds only for when lsp server available
	local on_attach = function(_, bufnr)
		-- keybind options
		local opts = { noremap = true, silent = true, buffer = bufnr }

		vim.keymap.set("n", "<leader>gf", "<cmd>Lspsaga lsp_finder<cr>", opts)
		vim.keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
		vim.keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<cr>", opts)
		vim.keymap.set("n", "<leader>vca", "<cmd>Lspsaga code_action<cr>", opts)
		vim.keymap.set("n", "<leader>vrn", "<cmd>Lspsaga rename<cr>", opts)
		vim.keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostic<cr>", opts)
		vim.keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostic<cr>", opts)
		vim.keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
		vim.keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
		vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
	end

	-- lua
	lspconfig.lua_ls.setup({
		-- capabilities = capabilities,
		on_attach = on_attach,
		settings = { -- custom settings for lua
			Lua = {
				-- make the language server recognize "vim" global
				diagnostics = {
					globals = { "vim" },
				},
				workspace = {
					-- make language server aware of runtime files
					library = {
                            [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                            [vim.fn.stdpath("config") .. "/lua"] = true,
					},
				},
			},
		},
	})

	local luacheck = require("efmls-configs.linters.luacheck")
	local stylua = require("efmls-configs.formatters.stylua")

	-- configure efm server
	lspconfig.efm.setup({
		filetypes = {
			"lua",
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
			},
		},
	})

	-- Format on Save
	local lsp_fmt_group = vim.api.nvim_create_augroup("LspFormattingGroup", {})
	vim.api.nvim_create_autocmd("BufWritePost", {
		group = lsp_fmt_group,
		callback = function()
			local efm = vim.lsp.get_active_clients({ name = "efm" })
			if vim.tbl_isempty(efm) then
				return
			end

			vim.lsp.buf.format({ name = "efm" })
		end,
	})
end

return {
	"neovim/nvim-lspconfig",
	config = config,
	lazy = false,
	dependencies = {
		"windwp/nvim-autopairs",
		"williamboman/mason.nvim",
		"creativenull/efmls-configs-nvim",
	},
}
