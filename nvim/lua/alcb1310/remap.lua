vim.g.mapleader = " "

vim.keymap.set("n", "<leader>pv", vim.cmd.Ex, {silent=true})

vim.keymap.set({"i", "v"}, "jk", "<esc>", {silent=true})
vim.keymap.set({"i", "v"}, "kj", "<esc>", {silent=true})
