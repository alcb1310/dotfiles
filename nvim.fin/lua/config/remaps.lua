local k = vim.keymap

local opts = {
     silent = true
}

k.set("n", "<leader>pv", vim.cmd.Ex, opts)

k.set({ "i", "v" }, "jk", "<ESC>", opts)
k.set({ "i", "v" }, "kj", "<ESC>", opts)
--
-- Close current buffer
k.set({ "n", "v" }, "<leader>bc", "<ESC>:bd<CR>", { desc = "Close current buffer", silent = true })

-- Moves the selected line up or down
k.set("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line up", silent = true })
k.set("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line down", silent = true })

k.set("n", "J", "mzJ`z", opts)
k.set("n", "<C-d>", "<C-d>zz", opts)
k.set("n", "<C-u>", "<C-u>zz", opts)
k.set("n", "n", "nzzzv", opts)
k.set("n", "N", "Nzzzv", opts)
k.set("n", "G", "Gzzzv", opts)

-- greatest remap ever
k.set("x", "<leader>p", [["_dP]], opts)

-- next greatest remap ever : asbjornHaland
k.set({ "n", "v" }, "<leader>y", [["+y]], opts)
k.set("n", "<leader>Y", [["+Y]], opts)

k.set("n", "<leader>vt", "<cmd>silent !tmux neww ~/.dotfiles/scripts/session-change.sh<CR>", opts)
-- k.set("n", "<leader>gb", "<cmd>silent !tmux neww ~/.dotfiles/scripts/gbranch.sh<CR>", opts)
k.set("n", "<leader>f", vim.lsp.buf.format, opts)

k.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], opts)
k.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", opts)
k.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/init.lua<CR>", opts)

k.set("n", "<leader><leader>", function()
     vim.cmd("so")
end, opts)

local lua_command = ":lua require('rest-nvim').run()<cr>"
vim.api.nvim_set_keymap("n", "<leader>ut", lua_command, opts)

k.set({ "n", "v", "i" }, "<A-v>", vim.cmd.vsplit, opts)
k.set({ "n", "v", "i" }, "<A-s>", vim.cmd.split, opts)

k.set("n", "gh", "<cmd>diffget //2<cr>", opts)
k.set("n", "gj", "<cmd>diffget //3<cr>", opts)
