local keymap = vim.keymap
local wk = require("which-key")
local opts = { noremap = true, silent = true, prefix = "<leader>", mode = "n" }
local builtin = require("telescope.builtin")

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selected line up" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selected line down" })

wk.register({
    y = { '"+y', "Yank to system clipboard" },
    s = {
        name = "Split commands",
        v = { ":vsplit<CR>", "Open vertical split" },
        h = { ":split<CR>", "Open horizontal split" },
        x = { ":close<CR>", "Close a split" },
    },
    g = {
        name = "Git commands",
        s = { ":LazyGit<CR>", "Open lazygit" },
        p = {
            name = "Pull requests",
            c = { ":Octo pr create", "Create a new Pull Request" },
            l = { ":Octo pr list", "List all Pull Requests" },
        },
        i = {
            name = "Issues",
            c = { ":Octo issue create", "Create a new Issue" },
            l = { ":Octo issue list", "List all Issues" },
        },
    },
    t = {
        name = "Test commands",
        r = { ":lua require('neotest').run.run()<CR>", "Run test nearest" },
        f = { ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Run test file" },
        s = { ":lua require('neotest').summary.toggle()<CR>", "Toggle test summary" },
    },
    x = {
        name = "Trouble commands",
        x = { ":Trouble<CR>", "Toggle trouble" },
        w = { ":Trouble workspace_diagnostics<CR>", "Trouble workspace diagnostics" },
        d = { ":Trouble document_diagnostics<CR>", "Trouble document diagnostics" },
        q = { ":Trouble quickfix<CR>", "Trouble quickfix" },
        l = { ":Trouble loclist<CR>", "Trouble loclist" },
        R = { ":Trouble lsp_references<CR>", "Trouble lsp references" },
    },
    f = {
        name = "Find",
        f = { builtin.find_files, "Files" },
        g = { builtin.live_grep, "Grep" },
        b = { builtin.buffers, "Buffers" },
        h = { builtin.help_tags, "Help" },
    },
}, opts)

opts = { noremap = true, silent = true, prefix = "<leader>", mode = "v" }

wk.register({
    y = { '"+y', "Yank to system clipboard" },
}, opts)

opts = { noremap = true, silent = true, prefix = "", mode = "n" }

wk.register({
    ["-"] = { ":Oil<CR>", "Open Oil file manager" },
    ["<C-u>"] = { "<C-u>zz", "Move half a page up and center the result line in the screen" },
    ["<C-d>"] = { "<C-d>zz", "Move half a page down and center the result line in the screen" },

    bc = { ":bdelete<CR>", "Close the current buffer" },

}, opts)
