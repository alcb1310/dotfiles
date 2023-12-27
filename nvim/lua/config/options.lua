local opt = vim.opt

-- Tab / Indentation
opt.tabstop = 4
opt.shiftwidth = 4
opt.softtabstop = 4
opt.expandtab = true
opt.smartindent = true
opt.wrap = false

-- Search
opt.incsearch = true
opt.ignorecase = true
opt.smartcase = true
opt.hlsearch = false

-- Appearence
-- Line Number
opt.number = true
opt.relativenumber = true
opt.termguicolors = true
opt.colorcolumn = '80'
opt.signcolumn = "yes"
opt.cmdheight = 1
opt.scrolloff = 8
opt.completeopt = "menuone,noinsert,noselect"

-- Behaviiour
opt.hidden = true
opt.errorbells = false
opt.swapfile = false
opt.backup = false
opt.undodir = vim.fn.expand("~/.vim/undodir")
opt.undofile = true
opt.backspace = "indent,eol,start"
opt.splitright = true
opt.splitbelow = true
opt.autochdir = false
opt.modifiable = true
opt.encoding = "UTF8"
