local config = function()
	local lsp = require('lsp-zero')
	local lspconfig = require('lspconfig')
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})
	local lsp_format_on_save = function(bufnr)
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd('BufWritePre', {
			group = augroup,
			buffer = bufnr,
			callback = function()
				vim.lsp.buf.format()
			end,
		})
	end

	lsp.preset('recommended')
	lsp.on_attach(function(client, bufnr)
		-- see :help lsp-zero-keybindings
		-- to learn the available actions
		-- lsp.default_keymaps({buffer = bufnr})
		local opts = { buffer = bufnr, remap = false }

		vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
		vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
		vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
		vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
		vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
		vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
		vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
		vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
		vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
		vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)

		lsp_format_on_save(bufnr)
	end)

	require('mason').setup({})
	require('mason-lspconfig').setup({
		ensure_installed = {
			'tsserver',
			'lua_ls',
			'gopls',
		},
		handlers = {
			lsp.default_setup,
		},
	})

	lspconfig.lua_ls.setup({
		settings = {
			Lua = {
				diagnostics = {
					globals = { 'vim' }
				}
			},
		},
	})
	lspconfig.tsserver.setup({})
	lspconfig.gopls.setup({})

	local cmp = require('cmp')
	local cmp_action = require('lsp-zero').cmp_action()

	cmp.setup({
		window = {
			completion = cmp.config.window.bordered(),
			documentation = cmp.config.window.bordered(),
		},
		mapping = cmp.mapping.preset.insert({
			['<C-Space>'] = cmp.mapping.complete(),
			['<C-f>'] = cmp_action.luasnip_jump_forward(),
			['<C-b>'] = cmp_action.luasnip_jump_backward(),
			['<C-u>'] = cmp.mapping.scroll_docs(-4),
			['<C-d>'] = cmp.mapping.scroll_docs(4),
		}),
		sources = {
			{ name = "nvim_lsp" },
		}
	})

	lsp.set_preferences({
		suggest_lsp_servers = true,
		sign_icons = {
			error = "",
			warn = "",
			hint = "",
			info = "",
		}
	})

	lsp.setup()
end

return {
	'VonHeikemen/lsp-zero.nvim',
	branch = 'v3.x',
	event = 'BufEnter',
	dependencies = {
		'williamboman/mason.nvim',
		'williamboman/mason-lspconfig.nvim',
		'neovim/nvim-lspconfig',
		'hrsh7th/cmp-nvim-lsp',
		'hrsh7th/nvim-cmp',
		'L3MON4D3/LuaSnip',
	},
	config = config,
}
