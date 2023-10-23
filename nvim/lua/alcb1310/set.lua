vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.cursorline = true
vim.opt.cursorcolumn = true

vim.opt.mouse = ""

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 5
vim.opt.expandtab = true
vim.opt.smartindent = true
vim.opt.autoindent = true

vim.opt.showtabline = 0 -- No tab line

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "yes"
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50
vim.opt.colorcolumn = "80"

-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#a6d189", bg = "none"})
-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#ca9ee6", bg = "none" })
-- vim.api.nvim_set_hl(0, "LineNr", { fg = "#33aa55", bg = "none"})
-- vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
-- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
