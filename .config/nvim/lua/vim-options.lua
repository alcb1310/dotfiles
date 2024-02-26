local o = vim.opt

o.relativenumber = true
o.number = true

o.termguicolors = true
o.cursorline = true
o.cursorcolumn = true

o.tabstop = 4
o.softtabstop = 4
o.shiftwidth = 4
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
-- o.signcolumn = "yes"
o.isfname:append("@-@")

o.foldenable = false

o.updatetime = 50
o.colorcolumn = "80"
