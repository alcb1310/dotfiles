-- local config = function()
-- 	require("nvim-treesitter.configs").setup({
-- 		indent = {
-- 			enable = true,
-- 		},
-- 		autotag = {
-- 			enable = true,
-- 		},
-- 		ensure_installed = {
-- 			"bash",
-- 			"c",
-- 			"cpp",
-- 			"lua",
-- 			"javascript",
-- 			"typescript",
-- 			"tsx",
-- 			"go",
-- 			"templ",
-- 			"gitignore",
-- 			"html",
-- 			"json",
-- 			"css",
-- 			"markdown",
-- 			"markdown_inline",
-- 			"http",
-- 		},
-- 		auto_install = true,
-- 		highlight = {
-- 			enable = true,
-- 			additional_vim_regex_highlighting = false,
-- 		},
-- 	})
-- end
local config = function()
	require("nvim-treesitter.configs").setup({
		ensure_installed = {
			"http",
			"json",
			"vim",
			"lua",
			"bash",
			"templ",
		},
		-- auto_install = true,
		highlight = {
			enable = true,
			additional_vim_regex_highlighting = false,
		},
	})

	vim.treesitter.language.register("markdown", "octo")
end

return {
	"nvim-treesitter/nvim-treesitter",
	run = ":TSUpdate",
	config = config,
	lazy = false,
}
