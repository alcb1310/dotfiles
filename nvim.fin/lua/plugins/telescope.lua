local k = vim.keymap

return {
	'nvim-telescope/telescope.nvim',
	tag = '0.1.5',
	lazy = false,
	dependencies = {
		'nvim-lua/plenary.nvim',
	},
	config = function()
		local builtin = require('telescope.builtin')
		k.set('n', '<leader>ff', builtin.find_files, {})
		k.set('n', '<leader>fg', builtin.live_grep, {})
		k.set('n', '<leader>fb', builtin.buffers, {})
		k.set('n', '<leader>fh', builtin.help_tags, {})
	end
}
