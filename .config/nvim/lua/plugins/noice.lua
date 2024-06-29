return {
    "folke/noice.nvim",
    event = "VeryLazy",
    opts = {
        routes = {
            {
                view = "notify",
                filter = { event = "msg_showmode" },
            },
        },
        cmdline = {
            view = "cmdline",
        },
    },
    dependencies = {
        "MunifTanjim/nui.nvim",
        {
            "rcarriga/nvim-notify",
            config = function()
                require("notify").setup({
                    background_colour = "#000000",
                })
            end,
        },
    },
}
