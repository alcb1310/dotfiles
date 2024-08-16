return {
    "kristijanhusak/vim-dadbod-ui",
    dependencies = {
        {
            "tpope/vim-dadbod",
            lazy = true,
        },
        "kristijanhusak/vim-dadbod-completion",
    },
    cmd = {
        "DBUI",
        "DBUIToggle",
        "DBUIAddConnection",
        "DBUIFindBuffer",
    },
    init = function()
        vim.g.db_ui_use_nerd_fonts = 1
    end,
    keys = {
        { "<leader>db", "<CMD>DBUI<CR>", desc = "Open DBUI" },
    },
}
