return {
	"nvim-telescope/telescope.nvim",
	tag = "0.1.8",
	cmd = "Telescope",
	dependencies = {
		"nvim-lua/plenary.nvim",
		{
			"nvim-telescope/telescope-ui-select.nvim",
			dependencies = { "nvim-telescope/telescope.nvim" },
			config = function()
				require("telescope").setup({
					extensions = {
						["ui-select"] = {
							require("telescope.themes").get_dropdown({}),
						},
					},
				})
				require("telescope").load_extension("ui-select")
			end,
		},
	},
	config = function()
		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
		vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
	end,
	keys = {
		{ "<leader>ff", "<CMD>Telescope find_files<CR>", desc = "Find files" },
		{ "<leader>fg", "<CMD>Telescope live_grep<CR>", desc = "Live grep" },
		{ "<leader>fb", "<CMD>Telescope buffers<CR>", desc = "Buffers" },
		{ "<leader>fh", "<CMD>Telescope help_tags<CR>", desc = "Help tags" },
	},
}
