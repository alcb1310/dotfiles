local k = vim.keymap

k.set("n", "<leader>gs", vim.cmd.Git, { desc="Git status", silent=true })
