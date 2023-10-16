return {
    'nvimdev/lspsaga.nvim',
    lazy=false,
    config = function()
        require('lspsaga').setup({
            -- keybindings for navigation in lspsaga window
            move_in_saga = {
                prev = "<C-k>",
                next = "<C-j>",
            },

            -- use enter to open file with finder
            finder_action_keys = {
                open = "<cr>",
            },

            -- use enter to open file with definitionpreview
            definition_action_keys = {
                edit = "<cr>",
            },
        })
    end,
    dependencies = {
        'nvim-treesitter/nvim-treesitter',
        'nvim-tree/nvim-web-devicons',
    }
}

