return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		pickers = {
			colorscheme = {
				enable_preview = true,
			},
			buffers = {
				mappings = {
					i = {
						["<c-d>"] = require("telescope.actions").delete_buffer,
					},
				},
			},
		},
	},
}
