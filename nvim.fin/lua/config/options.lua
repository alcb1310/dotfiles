vim.g.mapleader = " "

local o = vim.opt

o.number = true
o.relativenumber = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 5
o.expandtab = true
o.smartindent = true
o.autoindent = true

o.showtabline = 0 -- No tab line

o.wrap = false

o.swapfile = false
o.backup = false
o.undodir = os.getenv("HOME") .. "/.vim/undodir"
o.undofile = true

o.hlsearch = false
o.incsearch = true

o.scrolloff = 8
o.signcolumn = "yes"
o.isfname:append("@-@")

o.foldenable = false

o.updatetime = 50
o.colorcolumn = "80"

vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })

o.termguicolors = true
o.cursorline = true
