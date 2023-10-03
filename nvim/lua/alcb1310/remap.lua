local k = vim.keymap

k.set("n", "<leader>pv", vim.cmd.Ex, { desc = "File explorer", silent = true })
k.set("n", "<leader><leader>", ":source<cr>", { desc = "Source current file", silent = true })
k.set("n", "<leader>bc", ":bd<cr>", { desc = "Close current buffer", silent = true })

k.set({ "i", "v" }, "jk", "<esc>", { desc = "Better escape", silent = true })
k.set({ "i", "v" }, "kj", "<esc>", { desc = "Better escape", silent = true })

k.set("n", "<C-h>", vim.cmd.TmuxNavigateLeft)
k.set("n", "<C-j>", vim.cmd.TmuxNavigateDown)
k.set("n", "<C-k>", vim.cmd.TmuxNavigateUp)
k.set("n", "<C-l>", vim.cmd.TmuxNavigatePrevious)

k.set("v", "J", ":m '>+1<CR>gv=gv")
k.set("v", "K", ":m '<-2<CR>gv=gv")

k.set("n", "J", "mzJ`z")
k.set("n", "<C-d>", "<C-d>zz")
k.set("n", "<C-u>", "<C-u>zz")
k.set("n", "n", "nzzzv")
k.set("n", "N", "Nzzzv")
k.set("n", "G", "Gzzzv")
--
-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

vim.keymap.set("n", "Q", "<nop>")
vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

local lua_command = ":lua require('rest-nvim').run()<cr>"
vim.api.nvim_set_keymap("n", "<leader>ut", lua_command, { silent = true })

vim.keymap.set({ "n", "v", "i" }, "<A-v>", vim.cmd.vsplit, {})
vim.keymap.set({ "n", "v", "i" }, "<A-s>", vim.cmd.split, {})

vim.keymap.set("n", "<leader>gil", ":Octo issue list<cr>", { desc = "List github issues", silent = true })
vim.keymap.set("n", "<leader>gic", ":Octo issue create<cr>", { desc = "Create github issues", silent = true })
vim.keymap.set("n", "<leader>prl", ":Octo pr list<cr>", { desc = "List github pull requests", silent = true })
vim.keymap.set("n", "<leader>prc", ":Octo pr create<cr>", { desc = "Create github pull requests", silent = true })
