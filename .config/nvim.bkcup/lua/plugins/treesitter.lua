return {
	"nvim-treesitter/nvim-treesitter",
	-- dependencies = {
	--     "vrischmann/tree-sitter-templ",
	-- },
	build = ":TSUpdate",
	config = function()
		require("nvim-treesitter.configs").setup({
			-- A list of parser names, or "all" (the five listed parsers should always be installed)
			ensure_installed = { "lua", "vimdoc", "query" },

			-- Install parsers synchronously (only applied to `ensure_installed`)
			sync_install = false,
			auto_install = true,

			highlight = {
				enable = true,
				additional_vim_regex_highlighting = false,
			},
		})
	end,
}
