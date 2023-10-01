local builtin = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', builtin.find_files, { desc="Find files", silent=true })
vim.keymap.set('n', '<leader>fl', builtin.live_grep, { desc="Grep a text", silent=true })
vim.keymap.set('n', '<leader>fb', builtin.buffers, { desc="List opened buffers", silent=true })
vim.keymap.set('n', '<leader>fh', builtin.help_tags, { desc="Help tags", silent=true })
vim.keymap.set('n', '<leader>fk', builtin.keymaps, { desc="Key maps", silent=true })
vim.keymap.set('n', '<leader>fg', builtin.git_files, { desc="Git files", silent=true })
