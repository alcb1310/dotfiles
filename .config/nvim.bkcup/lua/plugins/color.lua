return {
	{
		"maxmx03/dracula.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local dracula = require("dracula")

			dracula.setup({
				transparent = true,
				on_colors = function(colors, color)
					return {
						-- override or create new colors
						mycolor = "#ffffff",
					}
				end,
				on_highlights = function(colors, color)
					return {
						Normal = { fg = colors.mycolor },
					}
				end,
				plugins = {
					["nvim-treesitter"] = true,
					["nvim-lspconfig"] = true,
					["nvim-navic"] = true,
					["nvim-cmp"] = true,
					["indent-blankline.nvim"] = true,
					["neo-tree.nvim"] = true,
					["nvim-tree.lua"] = true,
					["which-key.nvim"] = true,
					["dashboard-nvim"] = true,
					["gitsigns.nvim"] = true,
					["neogit"] = true,
					["todo-comments.nvim"] = true,
					["lazy.nvim"] = true,
					["telescope.nvim"] = true,
					["noice.nvim"] = true,
					["hop.nvim"] = true,
					["mini.statusline"] = true,
					["mini.tabline"] = true,
					["mini.starter"] = true,
					["mini.cursorword"] = true,
				},
			})
		end,
	},
	{
		"catppuccin/nvim",
		name = "catppuccin",
		priority = 1000,
		opts = {
			transparent_background = true,
			integrations = {
				cmp = true,
				gitsigns = true,
				nvimtree = true,
				treesitter = true,
				notify = false,
				mini = {
					enabled = true,
					indentscope_color = "",
				},
			},
		},
	},
}
