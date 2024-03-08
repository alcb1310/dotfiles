local k = vim.keymap.set

k("n", "<leader>pv", ":Oil<CR>", { silent = true })
k({ "i", "v" }, "jk", "<Esc>", { silent = true })
k({ "i", "v" }, "kj", "<Esc>", { silent = true })

vim.keymap.set("n", "<leader>bc", ":bd<CR>", {})

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line up", silent = true })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line down", silent = true })

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")
vim.keymap.set("n", "G", "Gzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

vim.keymap.set("n", "√", ":vsplit<cr>", { silent = true })
vim.keymap.set("n", "ß", ":split<cr>", { silent = true })

vim.keymap.set("n", "<leader>tt", ":TodoTelescope<cr>", { silent = true })
vim.keymap.set("n", "<leader>tx", ":TodoTrouble<cr>", { silent = true })

vim.keymap.set("v", "S", ":'<,'>Silicon<CR>", {}) -- { silent = true })
