local servers = {
	"lua_ls",
	"tsserver",
	"templ",
	"gopls",
	"html",
	"htmx",
	"cssls",
	"tailwindcss",
	"clangd",
	"emmet_ls",
}

local on_attach = function(client, bufnr)
	local augroup = vim.api.nvim_create_augroup("LspFormatting", {})

	if client.supports_method("textDocument/formatting") then
		vim.api.nvim_clear_autocmds({ group = augroup, buffer = bufnr })
		vim.api.nvim_create_autocmd("BufWritePre", {
			group = augroup,
			buffer = bufnr,
			callback = function()
				if vim.bo.filetype == "templ" then
					local filename = vim.api.nvim_buf_get_name(bufnr)
					local cmd = "templ fmt " .. vim.fn.shellescape(filename)

					vim.fn.jobstart(cmd, {
						on_exit = function()
							-- Reload the buffer only if it's still the current buffer
							if vim.api.nvim_get_current_buf() == bufnr then
								vim.cmd("e!")
							end
						end,
					})
				else
					vim.lsp.buf.format()
				end
			end,
		})
	end
end

return {
	{
		"neovim/nvim-lspconfig",
		dependencies = {
			{ "hrsh7th/cmp-nvim-lsp" },
			{ "hrsh7th/nvim-cmp" },
			{
				"williamboman/mason.nvim",
				config = function()
					require("mason").setup()
				end,
			},
			{
				"williamboman/mason-lspconfig.nvim",
				config = function()
					require("mason-lspconfig").setup({
						ensure_installed = servers,
					})
				end,
			},
			{ "L3MON4D3/LuaSnip" },
		},
		event = { "BufReadPre", "BufNewFile" },
		config = function()
			local lspconfig = require("lspconfig")
			local capabilities = require("cmp_nvim_lsp").default_capabilities()

			for _, lsp in ipairs(servers) do
				lspconfig[lsp].setup({
					on_attach = on_attach,
					capabilities = capabilities,
				})
			end

			lspconfig.templ.setup({
				on_attach = on_attach,
				capabilities = capabilities,
			})

			vim.filetype.add({ extension = { templ = "templ" } })
			lspconfig.html.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "html", "templ" },
			})

			lspconfig.htmx.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "html", "templ" },
			})

			lspconfig.tailwindcss.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "templ", "astro", "javascript", "typescript", "react" },
				init_options = { userLanguages = { templ = "html" } },
			})

			lspconfig.emmet_ls.setup({
				on_attach = on_attach,
				capabilities = capabilities,
				filetypes = { "templ", "astro", "javascript", "typescript", "react" },
				init_options = { userLanguages = { templ = "html" } },
			})

			local wk = require("which-key")
			local opts = { noremap = true, silent = true, prefix = "<leader>", mode = "n" }

			wk.register({
				D = { vim.lsp.buf.type_definition, "Type definition" },
				e = { vim.diagnostic.open_float, "Open diagnostic" },
				q = { vim.diagnostic.setloclist, "Set Loc List" },
				w = {
					name = "workspace",
					a = { vim.lsp.buf.add_workspace_folder, "Add Workspace folder" },
					l = {
						function()
							print(vim.inspect(vim.lsp.buf.list_workleader_folders()))
						end,
						"List workspace folders",
					},
					r = { vim.lsp.buf.remove_workspace_folder, "Remove workspace folder" },
				},
				["rn"] = { vim.lsp.buf.rename, "Rename variable" },
				["ca"] = { vim.lsp.buf.code_action, "Show code actions" },
				["lf"] = {
					function()
						vim.lsp.buf.format()
					end,
					"Format",
				},
			}, opts)

			opts = { noremap = true, silent = true, prefix = "", mode = "n" }
			wk.register({
				K = { vim.lsp.hover, "Show definition" },
				["[d"] = { vim.diagnostic.goto_prev, "Go to previous diagnostic" },
				["]d"] = { vim.diagnostic.goto_next, "Go to next diagnostic" },
				["gD"] = { vim.lsp.buf.declaration, "Go to declaration" },
				["gd"] = { vim.lsp.buf.definition, "Go to definition" },
				["gi"] = { vim.lsp.buf.implementation, "Go to implementation" },
				["gr"] = { vim.lsp.buf.references, "Go to references" },
				["<c-k>"] = { vim.lsp.buf.signature_help, "Get signature help" },
			}, opts)

			opts = { noremap = true, silent = true, prefix = "<leader>", mode = "v" }
			wk.register({
				["ca"] = { vim.lsp.buf.code_action, "Show code actions" },
			}, opts)
		end,
	},
}
