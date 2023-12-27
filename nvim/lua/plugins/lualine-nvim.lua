local config = function()
    local theme = require("lualine.themes.nightfox")
    theme.normal.c.bg = nil

    require("lualine").setup({
        options = {
            theme = theme,
            icons_enabled = true,
            globalstatus = true
        },
    })
end

return {
    'nvim-lualine/lualine.nvim',
    config = config,
    lazy = false,
}
