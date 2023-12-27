local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system({
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable", -- latest stable release
		lazypath,
	})
end
vim.opt.rtp:prepend(lazypath)

local opts = {
	defaults = {
		lazy = true,
	},
	install = {
		colorscheme = { "nightfox" },
	},
	rip = {
		disabled_plugins = {
			"gzip",
			"matchit",
			"matchparen",
			"tarPlugin",
			"tohtml",
			"tutor",
			"zipPlugin",
		},
		change_detection = {
			notify = false,
		},
	},
}

-- Example using a list of specs with the default options

require("lazy").setup('plugins', opts)
