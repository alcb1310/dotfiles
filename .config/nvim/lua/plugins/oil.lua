return {
	"stevearc/oil.nvim",
	event = "VeryLazy",
	opts = {},
	-- Optional dependencies
	dependencies = { "nvim-tree/nvim-web-devicons" },
	config = function()
		require("oil").setup({
			view_options = {
				show_hidden = false,
				-- This function defines what will never be shown, even when `show_hidden` is set
				is_always_hidden = function(name, bufnr)
					return vim.startswith(name, "node_modules")
				end,
			},
		})
	end,
}
