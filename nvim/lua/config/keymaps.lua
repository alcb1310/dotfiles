local keymap = vim.keymap

-- Better escape
keymap.set({"i", "v"}, "jk", "<Esc>", {desc ="better escape", silent=true})
keymap.set({"i", "v"}, "kj", "<Esc>", {desc ="better escape", silent=true})

-- Directory Navigation
keymap.set("n", "<leader>pv", vim.cmd.Ex, {desc="load navigation window", noremap=true, silent=true})

-- Pane Navigation
keymap.set("n", "<C-h>", "<C-w>h>", {desc="Go to left pane", noremap=true, silent=true})
keymap.set("n", "<C-j>", "<C-w>j>", {desc="Go to bottom pane", noremap=true, silent=true})
keymap.set("n", "<C-k>", "<C-w>k>", {desc="Go to top pane", noremap=true, silent=true})
keymap.set("n", "<C-l>", "<C-w>l>", {desc="Go to right pane", noremap=true, silent=true})

-- Window Management
keymap.set("n", "<leader>sv", ":vsplit<cr>", {desc="split vertically", noremap=true, silent=true})
keymap.set("n", "<leader>sh", ":split<cr>", {desc="split horizontally", noremap=true, silent=true})

-- Indent
keymap.set("v", "<", "<gv", {desc="remove indentation"})
keymap.set("v", ">", ">gv", {desc="add indentation"})

-- Buffers
keymap.set("n", "<leader>bc", ":bd<cr>", {desc = "buffer close", noremap=true, silent=true})

-- Source init.lua file
keymap.set("n", "<leader><leader>", ":so ~/.config/nvim/init.lua<cr>", {desc="source config files", noremap=true, silent=true})
