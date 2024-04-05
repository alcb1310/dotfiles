return {
	"stevearc/oil.nvim",
	opts = {
		view_options = {
			show_hidden = false,
		},
		keymaps_help = {
			border = "rounded",
		},
		columns = {
			"icon",
			-- "permissions",
			-- "size",
			-- "mtime",
		},
		win_options = {
			signcolumn = "no",
		},
		float = {
			-- Padding around the floating window
			padding = 2,
			max_width = 0,
			max_height = 0,
			border = "rounded",
			win_options = {
				winblend = 0,
			},
			-- This is the config that will be passed to nvim_open_win.
			-- Change values here to customize the layout
			override = function(conf)
				return conf
			end,
		},
	},
	lazy = false,
	dependencies = {
		"nvim-tree/nvim-web-devicons",
	},
}
