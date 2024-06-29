return {
    "vhyrro/luarocks.nvim",
    priority = 1000,
    lazy = false,
    config = true,
    opts = {
        rocks = { "lua-curl", "nvim-nio", "mimetypes", "xml2lua" }
    }
}
