local k = vim.keymap

k.set("n", "<leader>pv", vim.cmd.Ex, { desc="File explorer", silent=true })
k.set("n", "<leader><leader>", ":source<cr>", { desc="Source current file", silent=true })
k.set("n", "<leader>bc", ":bd<cr>", { desc="Close current buffer", silent=true })

k.set({"i", "v"}, "jk", "<esc>", { desc="Better escape", silent=true })
k.set({"i", "v"}, "kj", "<esc>", { desc="Better escape", silent=true })
