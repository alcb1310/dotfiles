local k = vim.keymap.set

-- Better way of escape
k({ "i", "v" }, "jk", "<ESC>", { desc = "Better escape", silent = true })
k({ "i", "v" }, "kj", "<ESC>", { desc = "Better escape", silent = true })

-- Open netrw file explorer
k("n", "<leader>pv", vim.cmd.Ex, { desc = "Open Netrw", silent = true })

-- Close current buffer
k({ "n", "v" }, "<leader>bc", "<ESC>:bd<CR>", { desc = "Close current buffer", silent = true })

-- Moves the selected line up or down
k("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line up", silent = true })
k("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line down", silent = true })

k("n", "J", "mzJ`z")
k("n", "<C-d>", "<C-d>zz")
k("n", "<C-u>", "<C-u>zz")
k("n", "n", "nzzzv")
k("n", "N", "Nzzzv")
k("n", "G", "Gzzzv")

-- greatest remap ever
k("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
k({ "n", "v" }, "<leader>y", [["+y]])
k("n", "<leader>Y", [["+Y]])

k("n", "<leader>vt", "<cmd>silent !tmux neww ~/.dotfiles/scripts/session-change.sh<CR>")
-- k("n", "<leader>gb", "<cmd>silent !tmux neww ~/.dotfiles/scripts/gbranch.sh<CR>")
k("n", "<leader>f", vim.lsp.buf.format)

k("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
k("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })
k("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/init.lua<CR>");

k("n", "<leader><leader>", function()
     vim.cmd("so")
end)

local lua_command = ":lua require('rest-nvim').run()<cr>"
vim.api.nvim_set_keymap("n", "<leader>ut", lua_command, { silent = true })

k({ "n", "v", "i" }, "<A-v>", vim.cmd.vsplit, {})
k({ "n", "v", "i" }, "<A-s>", vim.cmd.split, {})

k("n", "gh", "<cmd>diffget //2<cr>", { desc = "Works on conflict" })
k("n", "gj", "<cmd>diffget //3<cr>", { desc = "Works on conflict" })

k("n", "<leader>tt", ":TodoTelescope<CR>", { desc = "Show TODOs", silent = true })
