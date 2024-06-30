local keymap = vim.keymap
local wk = require("which-key")
local builtin = require("telescope.builtin")

keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selected line up" })
keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selected line down" })

local opts = { noremap = true, silent = true, prefix = "<leader>", mode = "n" }

wk.register({
    ["ee"] = { "iif err != nil {<cr>}<esc>Oreturn err", "Golang error comparison" },
    f = {
        name = "Find",
        b = { builtin.buffers, "Find open buffers" },
        c = { builtin.commands, "Find commands" },
        f = { builtin.find_files, "Find files" },
        g = { builtin.live_grep, "Grep files" },
        h = { builtin.help_tags, "Find help" },
        m = { builtin.marks, "Find marks" },
        s = { builtin.colorscheme, "Find colorscheme" },
    },
    g = {
        name = "Git commands",
        i = {
            name = "Issues",
            c = { ":Octo issue create<cr>", "Create new issue" },
            l = { ":Octo issue list<cr>", "List all issues" },
        },
        p = {
            name = "Pull request",
            c = { ":Octo pr create<cr>", "Create a new pull request" },
            l = { ":Octo pr list<cr>", "List all pull requests" },
        },
    },
    s = {
        name = "Split commands",
        v = { ":vsplit<cr>", "Split vertically" },
        h = { ":split<cr>", "Split horizontally" },
        x = { ":close<cr>", "Close a split" },
    },
    t = {
        name = "Todo / Test commands",
        r = { ":lua require('neotest').run.run()<CR>", "Run test nearest" },
        f = { ":lua require('neotest').run.run(vim.fn.expand('%'))<CR>", "Run test file" },
        s = { ":lua require('neotest').summary.toggle()<CR>", "Toggle test summary" },
        t = { ":TodoTelescope<cr>", "Open TODO list" },
    },
    O = { "<cmd>Octo<cr>", "Open Octo" },
}, opts)

opts = { noremap = true, silent = true, prefix = "", mode = "n" }
wk.register({
    ["-"] = { ":Oil<cr>", "Open Oil" },
    ["<c-d>"] = { "<c-d>zz", "Move half a page down and center the result line int the screen" },
    ["<c-u>"] = { "<c-u>zz", "Move half a page up and center the result line int the screen" },
}, opts)

opts = { noremap = true, silent = true, prefix = "<leader>", mode = "v" }
wk.register({
    y = { '"+y', "Yank to system clipboard" },
}, opts)
