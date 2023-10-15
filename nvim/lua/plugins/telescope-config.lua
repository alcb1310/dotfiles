local keymap = vim.keymap

local config = function()
    local telescope = require('telescope')

    telescope.setup({
        defaults = {
            mappings = {
                i = {
                    ["<C-j>"] = "move_selection_next",
                    ["<C-k>"] = "move_selection_previous",
                },
            },
        },
        pickers = {
            find_files = {
                previewer = true,
                hidden = true
            },
            live_grep = {
                previewer = true,
            },
            buffers = {
                previewer = false,
            },
        },
    })
end

return {
    'nvim-telescope/telescope.nvim',
    tag = '0.1.4',
    lazy = false,
    dependencies = { 'nvim-lua/plenary.nvim' },
    config = config,
    keys = {
        keymap.set("n", "<leader>ff", ":Telescope find_files<cr>", {desc="Find files", silent=true}),
        keymap.set("n", "<leader>lg", ":Telescope live_grep<cr>", {desc="Live Grep", silent=true}),
        keymap.set("n", "<leader>fb", ":Telescope buffers<cr>", {desc="Show opened buffers", silent=true}),
        keymap.set("n", "<leader>fh", ":Telescope help_tags<cr>", {desc="Help tags", silent=true}),
        keymap.set("n", "<leader>fk", ":Telescope keymaps<cr>", {desc="Help tags", silent=true}),
        keymap.set("n", "<leader>fa", ":Telescope<cr>", {desc="Telescope", silent=true}),
    },
}

