return {
    "williamboman/mason.nvim",
    event = { "BufReadPre", "BufNewFile" },    
    cmd = "Mason",
    config = {
        ui = {
            icons = {
                package_installed = "✓",
                package_pending = "➜",
                package_uninstalled = "✗"
            }
        },
    },
}
