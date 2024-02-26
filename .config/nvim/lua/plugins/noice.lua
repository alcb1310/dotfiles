return {
	"folke/noice.nvim",
	event = "VeryLazy",
	dependencies = {
		"MunifTanjim/nui.nvim",
		"rcarriga/nvim-notify",
	},
	opts = {},
	config = function()
		require("notify").setup({
			background_colour = "#000000",
		})
	end,
}
