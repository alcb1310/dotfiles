return {
	"nvim-treesitter/nvim-treesitter",
	dependencies = {
		"nvim-treesitter/nvim-treesitter-textobjects",
		{
			"nvim-treesitter/nvim-treesitter-context",
			opts = {
				enable = true,
				mode = "topline",
				line_numbers = true,
			},
		},
	},
	lazy = false,
	build = ":TSUpdate",
	opts = {
		-- A list of parser names, or "all" (the five listed parsers should always be installed)
		ensure_installed = {
			"lua",
			"vim",
			"vimdoc",
			"json",
			"http",
			"cpp",
		},

		-- Install parsers synchronously (only applied to `ensure_installed`)
		sync_install = false,
		auto_install = true,

		highlight = {
			enable = true,
		},
	},
	config = function(_, opts)
		require("nvim-treesitter.configs").setup(opts)

		vim.api.nvim_create_autocmd("BufWritePost", {
			pattern = { "markdown" },
			callback = function()
				require("treesitter-context").disable()
			end,
		})
	end,
}
