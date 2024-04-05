vim.g.mapleader = " " -- Defines mapleader to be the space, is always good to have it defined as early as possible

-- load remaps and options
require("vim-options")
require("remaps")
require("autocommand")

-- Lazy git package manager installation
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

-- define lazy options
local opts = {
	defaults = {
		lazy = true,
	},
	change_detection = {
		notify = false,
		enabled = false,
	},
}

require("lazy").setup("plugins", opts)
