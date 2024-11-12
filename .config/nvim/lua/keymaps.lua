vim.keymap.set("n", "-", "<CMD>Oil<CR>", { desc = "Open parent directory" })

vim.keymap.set("n", "sv", ":vsplit<CR>", { desc = "Split window vertically" })
vim.keymap.set("n", "sh", ":split<CR>", { desc = "Split window horizontally" })
vim.keymap.set("n", "sc", ":close<CR>", { desc = "Close window" })

vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

vim.keymap.set("n", "<leader>ed", "oif err!=nil {<cr>log.Println(err)<cr>}<esc>k")
vim.keymap.set("n", "<leader>eu", "Oif err!=nil {<cr>log.Println(err)<cr>}<esc>k")

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "<leader>y", "\"+y")
vim.keymap.set("v", "<leader>y", "\"+y")
vim.keymap.set("n", "<leader>Y", "\"+Y")
