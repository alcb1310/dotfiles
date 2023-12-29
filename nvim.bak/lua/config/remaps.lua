local k = vim.keymap.set
local opts = {
	noremap = true,
	silent = true,
}

-- Better escape
k({ "i", "v" }, "jk", "<ESC>", opts)
k({ "i", "v" }, "kj", "<ESC>", opts)

-- Directory navigation
k("n", "<leader>pv", vim.cmd.Ex, opts)

-- Split
k("n", "<A-v>", ":vsplit<cr>", opts)
k("n", "<A-s>", ":split<cr>", opts)
k("n", "<leader>sm", ":MaximizerToggle<cr>", opts)

-- Navigate between panes
k("n", "<C-h>", "<C-w>h", opts)
k("n", "<C-j>", "<C-w>j", opts)
k("n", "<C-k>", "<C-w>k", opts)
k("n", "<C-l>", "<C-w>l", opts)

-- Close buffers
k({ "n", "v" }, "<leader>bc", ":bdelete<cr>", opts)

-- Rest nvim
local lua_command = ":lua require('rest-nvim').run()<cr>"
vim.api.nvim_set_keymap("n", "<leader>ut", lua_command, { silent = true })

-- Moves the selected line up or down
k("v", "J", ":m '>+1<CR>gv=gv", { desc = "Move selected line up", silent = true })
k("v", "K", ":m '<-2<CR>gv=gv", { desc = "Move selected line down", silent = true })

k("n", "J", "mzJ`z")
k("n", "<C-d>", "<C-d>zz")
k("n", "<C-u>", "<C-u>zz")
k("n", "n", "nzzzv")
k("n", "N", "Nzzzv")
k("n", "G", "Gzzzv")

-- next greatest remap ever : asbjornHaland
k({ "n", "v" }, "<leader>y", [["+y]])
k("n", "<leader>Y", [["+Y]])

k("n", "<leader>vt", "<cmd>silent !tmux neww ~/.dotfiles/scripts/session-change.sh<CR>")

k("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
k("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

k("n", "gh", "<cmd>diffget //2<cr>", { desc = "Works on conflict" })
k("n", "gj", "<cmd>diffget //3<cr>", { desc = "Works on conflict" })

-- nvim-dap
k("n", "<F5>", ":lua require'dap'.continue()<cr>", opts)
k("n", "<F10>", ":lua require'dap'.step_over()<cr>", opts)
k("n", "<F11>", ":lua require'dap'.step_into()<cr>", opts)
k("n", "<F12>", ":lua require'dap'.step_out()<cr>", opts)
k("n", "<leader>b", ":lua require'dap'.toggle_breakpoint()<cr>", opts)
k("n", "<leader>B", ":lua require'dap'.set_breakpoint(vim.fn.input('Breakpoint condition: '))<cr>", opts)
k("n", "<leader>lp", ":lua require'dap'.set_breakpoint(nil, nil, vim.fn.input('Log point message: '))<cr>", opts)
k("n", "<leader>dr", ":lua require'dap'.repl.open()<cr>", opts)
k("n", "<leader>dl", ":lua require'dap'.run_last()<cr>", opts)
k("n", "<leader>td", ":lua require'dap-go'.debug_test()<cr>", opts)
k("n", "<leader>du", ":lua require'dapui'.toggle()<cr>", opts)
