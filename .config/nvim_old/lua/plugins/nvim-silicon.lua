return {
    "michaelrommel/nvim-silicon",
    lazy = true,
    cmd = "Silicon",
    config = function()
        require("silicon").setup({
            font = "Hack Nerd Font=34",
            theme = "Nord",
            window_title = function()
                return vim.fn.fnamemodify(
                    vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()),
                    ":t"
                )
            end,
        })
    end,
}
