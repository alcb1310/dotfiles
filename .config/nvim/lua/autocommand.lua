local api = vim.api

api.nvim_create_autocmd("TextYankPost", {
    desc = "Highlight on yank",
    group = api.nvim_create_augroup("YankHighlight", { clear = true }),
    callback = function()
        vim.highlight.on_yank()
    end,
})
