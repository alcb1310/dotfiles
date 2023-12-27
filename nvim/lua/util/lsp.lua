local k = vim.keymap.set
local M = {}

-- enable keybinds only for when lsp server available
M.on_attach = function(_, bufnr)
	-- keybind options
	local opts = { noremap = true, silent = true, buffer = bufnr }

	-- set keybinds
	k("n", "gD", "<cmd>lua vim.lsp.buf.declaration<cr>", opts)
	k("n", "gd", "<cmd>Lspsaga goto_definition<cr>", opts)
	k("n", "K", "<cmd>Lspsaga hover_doc<cr>", opts)
	k("n", "gi", "<cmd>lua vim.lsp.buf.implementation<cr>", opts)

	k("n", "<leader>ca", "<cmd>Lspsaga code_action<cr>", opts)
	k("v", "<leader>ca", "<cmd>Lspsaga range_code_action<cr>", opts)
	k("n", "<leader>rn", "<cmd>Lspsaga rename<cr>", opts)
	k("n", "<leader>gs", "<cmd>Lspsaga signature_help<cr>", opts)
	k("n", "<leader>gf", "<cmd>Lspsaga lsp_finder<cr>", opts)
	k("n", "]", "<cmd>Lspsaga diagnostic_jump_next<cr>", opts)
	k("n", "[", "<cmd>Lspsaga diagnostic_jump_prev<cr>", opts)
end

return M
