local config = function() 
    -- local theme = require("lualine.themes.caret")
    -- theme.normal.c.bg = nil

    require('lualine').setup({
        options = {
            theme = auto,
            globalstatus = true,
        },
        sections = {
            lualine_a = {
                'mode',
            },
            lualine_b = {'branch', 'diff', 'diagnostics'},
            lualine_c = {'filename'},
            lualine_x = {'encoding', 'fileformat', 'filetype'},
            lualine_y = {'progress'},
            lualine_z = {'location'}
        },
    })
end

return {
    "nvim-lualine/lualine.nvim",
    lazy = false,
    dependencies = {
        {'nvim-tree/nvim-web-devicons', opt = true},
    },
    config = config
}
