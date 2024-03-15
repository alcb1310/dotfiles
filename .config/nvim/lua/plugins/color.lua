return {
	{
		"catppuccin/nvim",
		name = "catpuccin",
		priority = 1000,
		enabled = false,
		config = function()
			-- require("lua.plugins.color").setup({
			-- 	transparent_background = true,
			-- 	term_colors = true,
			-- })
			-- vim.cmd.colorscheme("catppuccin")
		end,
	},
	{
		"projekt0n/caret.nvim",
		priority = 1000,
		config = function()
			require("caret").setup({
				options = {
					transparent = true,
					inverted_signs = false,
				},
			})
			vim.cmd.colorscheme("caret")
		end,
	},
}
