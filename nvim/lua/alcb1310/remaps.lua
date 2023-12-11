local k = vim.keymap.set

-- Better way of escape
k({ "i", "v" }, "jk", "<ESC>", { desc = "Better escape", silent = true })
k({ "i", "v" }, "kj", "<ESC>", { desc = "Better escape", silent = true })

-- Open netrw file explorer
k("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Netrw", silent = true })

-- Close current buffer
k({ "n", "v" }, "<leader>bc", "<ESC>:bd<CR>", { desc = "Close current buffer", silent = true })

-- Moves the selected line up or down
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

vim.keymap.set("n", "<leader>vt", "<cmd>silent !tmux neww ~/.dotfiles/scripts/session-change.sh<CR>")
-- vim.keymap.set("n", "<leader>gb", "<cmd>silent !tmux neww ~/.dotfiles/scripts/gbranch.sh<CR>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/init.lua<CR>");

vim.keymap.set("n", "<leader><leader>", function()
     vim.cmd("so")
end)

local lua_command = ":lua require('rest-nvim').run()<cr>"
vim.api.nvim_set_keymap("n", "<leader>ut", lua_command, { silent = true })

vim.keymap.set({ "n", "v", "i" }, "<A-v>", vim.cmd.vsplit, {})
vim.keymap.set({ "n", "v", "i" }, "<A-s>", vim.cmd.split, {})

vim.keymap.set("n", "gh", "<cmd>diffget //2<cr>", { desc = "Works on conflict" })
vim.keymap.set("n", "gj", "<cmd>diffget //3<cr>", { desc = "Works on conflict" })
