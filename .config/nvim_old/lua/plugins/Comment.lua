return {
    "numToStr/Comment.nvim",
    opts = {
        toggler = {
            line = "gcc",
            block = "gb",
        },
        ignore = "^$", -- ignore empty lines
        padding = true,
    },
    event="BufReadPost",
}
