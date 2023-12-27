local k = vim.keymap.set
-- Fuzzy finder
return {
	'nvim-telescope/telescope.nvim',
	lazy = false,
	branch = '0.1.x',
	dependencies = {
		{ 'nvim-lua/plenary.nvim' },
		{
			'nvim-telescope/telescope-fzf-native.nvim',
			build = 'make',
			cond = function()
				return vim.fn.executable 'make' == 1
			end,
		},
	},
	config = function()
		local builtin = require('telescope.builtin')

		k('n', '<leader>ff', builtin.find_files, {desc='Find files'})
		k('n', '<leader>lg', builtin.live_grep, {desc='Live grep'})
		k('n', '<leader>fb', builtin.buffers, {desc='List buffers'})
		k('n', '<C-g>', builtin.git_files, {desc='List git files'})
		k('n', '<leader>fh', builtin.help_tags, {desc='List help tags'})
		k('n', '<leader>gb', builtin.git_branches, {desc='Git branches'})
		k('n', '<leader>qf', builtin.quickfix, {desc='Quick fix'})

		k('n', '<leader>ps', function()
			builtin.grep_string({ search = vim.fn.input('Grep > ') })
		end, {desc='Search for a text'})
	end,
	opts = {
		defaults = {
			layout_config = {
				vertical = {
					width = 0.75
				}
			}
		}
	}
}
