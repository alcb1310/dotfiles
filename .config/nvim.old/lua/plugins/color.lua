return {
    {
        'projekt0n/caret.nvim',
        lazy = false, -- make sure we load this during startup if it is your main colorscheme
        -- priority = 1000, -- make sure to load this before all the other start plugins
        opts = {
            options = {
                transparent = true,
            }
        },
        config = function(_, opts)
            require('caret').setup(opts)
            -- vim.cmd('colorscheme caret')
        end,
    },
    {
        'rose-pine/neovim',
        name = 'rose-pine',
        lazy = false,
        priority = 1000,
        opts = {
            dark_variant = "main",
            styles = {
                transparency = true,
            },
        },
        config = function(_, opts)
            require('rose-pine').setup(opts)
        end,
    }
}
