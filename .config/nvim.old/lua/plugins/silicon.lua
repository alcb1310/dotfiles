return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = { "Silicon" },
    config = function()
        require("silicon").setup({
            font = "Hack Nerd Font Mono",
            theme = "gruvbox-dark",
            pad_horiz = 100,
            pad_vert = 80,
            no_line_number = false,
            tab_width = 2,
            background = "#7680e8",

            shadwo_offset_x = 8,
            shadow_offset_y = 8,
            shadow_color = "#100808",
        })
    end,
}
