local k = vim.keymap.set

return {
    "Exafunction/codeium.vim",
    event = "BufEnter",
    config = function()
        k("i", "<C-g>", function() return vim.fn["codeium#Accept"]() end, {expr = true, silent=true})
        k("i", "<C-;>", function() return vim.fn["codeium#CycleCompletions"](1) end, {expr = true, silent=true})
        k("i", "<C-,>", function() return vim.fn["codeium#CycleCompletions"](-1) end, {expr = true, silent=true})
        k("i", "<C-x>", function() return vim.fn["codeium#Clear"]() end, {expr = true, silent=true})
    end
}
