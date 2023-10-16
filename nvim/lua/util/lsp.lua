local keymap = vim.keymap
local M = {}

-- enable keybinds only for when lsp server available
M.on_attach = function(client, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	keymap.set("n", "<leader>gf", "<cmd>Lspsaga lsp_finder<cr>", opts)
	keymap.set("n", "<leader>gD", "<cmd>lua vim.lsp.buf.declaration()<cr>", opts)
	keymap.set("n", "<leader>gd", "<cmd>Lspsaga goto_definition<cr>", opts)
	keymap.set("n", "<leader>vca", "<cmd>Lspsaga code_action<cr>", opts)
	keymap.set("n", "<leader>vrn", "<cmd>Lspsaga rename<cr>", opts)
	keymap.set("n", "<leader>D", "<cmd>Lspsaga show_line_diagnostic<cr>", opts)
	keymap.set("n", "<leader>d", "<cmd>Lspsaga show_cursor_diagnostic<cr>", opts)
	keymap.set("n", "<leader>pd", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
	keymap.set("n", "<leader>nd", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
	keymap.set("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
end

return M
