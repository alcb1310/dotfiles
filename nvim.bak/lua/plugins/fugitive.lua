local k = vim.keymap.set

return {
	"tpope/vim-fugitive",
	event = "BufEnter",
	keymaps = {
		k("n", "gs", ":Git<cr>", { silent = true, desc = "Git status", noremap = true }),
	},
}
