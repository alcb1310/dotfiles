return {
    "m4xshen/hardtime.nvim",
    dependencies = { "MunifTanjim/nui.nvim", "nvim-lua/plenary.nvim" },
    event = "BufEnter",
    opts = {
        allow_different_key = true,
        restriction_mode = "hint",
    },
}
