local k = vim.keymap.set
local opts = {
    noremap = true,
    silent = true,
}

local config = function()
    local telescope = require("telescope")

    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                },
            },
        },
    })
end

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.5',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = config,
    keys = {
        k('n', '<leader>ff', ":Telescope find_files<CR>", opts),
        k('n', '<leader>lg', ":Telescope live_grep<CR>", opts),
        k('n', '<leader>fb', ":Telescope buffers<CR>", opts),
        k('n', '<leader>fh', ":Telescope help_tags<CR>", opts),
        k('n', '<leader>fk', ":Telescope keymaps<CR>", opts),
        k('n', '<leader>fa', ":Telescope<CR>", opts),
    }
}
