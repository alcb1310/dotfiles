--
--
--                                              ###    ##        ######  ########
--                                             ## ##   ##       ##    ## ##     ##
--                                            ##   ##  ##       ##       ##     ##
--                                           ##     ## ##       ##       ########
--                                           ######### ##       ##       ##     ##
--                                           ##     ## ##       ##    ## ##     ##
--                                           ##     ## ########  ######  ########
--
--
--
--
--                                   ##    ## ########  #######  ##     ## #### ##     ##
--                                   ###   ## ##       ##     ## ##     ##  ##  ###   ###
--                                   ####  ## ##       ##     ## ##     ##  ##  #### ####
--                                   ## ## ## ######   ##     ## ##     ##  ##  ## ### ##
--                                   ##  #### ##       ##     ##  ##   ##   ##  ##     ##
--                                   ##   ### ##       ##     ##   ## ##    ##  ##     ##
--                                   ##    ## ########  #######     ###    #### ##     ##
--
--
--
--
--     ######   #######  ##    ## ######## ####  ######   ##     ## ########     ###    ######## ####  #######  ##    ##
--    ##    ## ##     ## ###   ## ##        ##  ##    ##  ##     ## ##     ##   ## ##      ##     ##  ##     ## ###   ##
--    ##       ##     ## ####  ## ##        ##  ##        ##     ## ##     ##  ##   ##     ##     ##  ##     ## ####  ##
--    ##       ##     ## ## ## ## ######    ##  ##   #### ##     ## ########  ##     ##    ##     ##  ##     ## ## ## ##
--    ##       ##     ## ##  #### ##        ##  ##    ##  ##     ## ##   ##   #########    ##     ##  ##     ## ##  ####
--    ##    ## ##     ## ##   ### ##        ##  ##    ##  ##     ## ##    ##  ##     ##    ##     ##  ##     ## ##   ###
--     ######   #######  ##    ## ##       ####  ######    #######  ##     ## ##     ##    ##    ####  #######  ##    ##
--
--

-- Defines space as the space leader, this should always be the first line of your configuration since it is used all
-- over the place
vim.g.mapleader = " "

-- Next I like to define some options that makes some quality of life improvements in your configuration
-- To get help you can run `:help ` follow by the option without the vim.opt.
--
-- For example if you run `:help number` will show you the help of the number option

vim.opt.number = true         -- This will display the line number in a file at the left of the text
vim.opt.relativenumber = true -- This will display numbers relative to the selected line allowing jumping between lines easier

vim.opt.cursorline = true     -- This will hightlight the line where the cursor is
vim.opt.cursorcolumn = true   -- This will highlight the column where the cursor is

vim.opt.termguicolors = true  -- Enables 24-bit RGB color int the TUI

vim.opt.tabstop = 2           -- Defines the number of spaces that a <Tab> in the file couns for. The default is 8, I like using 2
vim.opt.softtabstop = 2       -- Defines the number of spaces that a <Tab> counts while performing editing operations. The default is 0
vim.opt.shiftwidth = 2        -- Defines the amount of whitespace used for one level of indentation, in columns
vim.opt.expandtab = true      -- In insert mode, uses the appropiate number of spacies to insert a <Tab>, uses the tabstop value
vim.opt.smartindent = true    -- When editing code, will smart autoindent when starting a new line
vim.opt.autoindent = true     -- Copy the indent from the current line when starting a new line

vim.opt.hlsearch = false      -- Highlights the previous search pattern, by default is true
vim.opt.incsearch = true      -- While typing a search command, it hightights the pattern

vim.opt.scrolloff = 8         -- Default value 0.  It is the number of lines to keep above and below the cursor making some context visible while moving around

-- TODO: explain what this lines do
vim.opt.swapfile = false
vim.opt.backup = false
-- vim.opt.undodir = os.getenv("XDG_STATE_HOME") .. "/nvim/undodir"
vim.opt.undofile = true

vim.opt.wrap = false -- Default value true.  Setting to false so lines will not wrap

-- Disable netrw in favor of using oil.nvim instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.opt.mouse = "" -- Disable mouse support

-- vim.keymap.set("n", "<leader>e", vim.cmd.Explore, { silent=true, desc="opens netRw to navigate the files under the current working directory"})
vim.keymap.set(
  "n",
  "<leader>e",
  ":Oil<CR>",
  { silent = true, desc = "opens netRw to navigate the files under the current working directory" }
)

vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv", { silent = true, desc = "Move selected line up" })
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv", { silent = true, desc = "Move selected line down" })

vim.keymap.set(
  { "n", "v" },
  "<leader>y",
  [["+y]],
  { silent = true, desc = "Yank the selected text to the system's clipboard" }
)

vim.keymap.set(
  "n",
  "<C-u>",
  "<C-u>zz",
  { silent = true, desc = "Move half a page up and center the result line in the screen" }
)
vim.keymap.set(
  "n",
  "<C-d>",
  "<C-d>zz",
  { silent = true, desc = "Move half a page down and center the result line in the screen" }
)

vim.keymap.set(
  "n",
  "<leader>s",
  [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]],
  { silent = true, desc = "Search and replace word under cursor" }
)

vim.keymap.set("n", "<leader>g", ":LazyGit<CR>", { silent = true, desc = "Open lazygit" })

vim.keymap.set("n", "bc", ":bdelete<CR>", { silent = true, desc = "Close the current buffer" })

vim.keymap.set("n", "<leader>O", ":Octo actions<CR>", { silent = true, desc = "Open Octo" })
vim.keymap.set("n", "<leader>prc", ":Octo pr create<CR>", { silent = true, desc = "Create a new Pull Request" })
vim.keymap.set("n", "<leader>prl", ":Octo pr list<CR>", { silent = true, desc = "List all Pull Requests" })
vim.keymap.set("n", "<leader>gic", ":Octo issue create<CR>", { silent = true, desc = "Create a new Issue" })
vim.keymap.set("n", "<leader>gil", ":Octo issue list<CR>", { silent = true, desc = "List all Issues" })


vim.api.nvim_create_autocmd("BufWritePre", {
  desc = "Go imports on save",
  group = vim.api.nvim_create_augroup("goimports", { clear = true }),
  pattern = "*.go",
  callback = function()
    local params = vim.lsp.util.make_range_params()
    params.context = { only = { "source.organizeImports" } }
    -- buf_request_sync defaults to a 1000ms timeout. Depending on your
    -- machine and codebase, you may want longer. Add an additional
    -- argument after params if you find that you have to write the file
    -- twice for changes to be saved.
    -- E.g., vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, 3000)
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
    for cid, res in pairs(result or {}) do
      for _, r in pairs(res.result or {}) do
        if r.edit then
          local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
          vim.lsp.util.apply_workspace_edit(r.edit, enc)
        end
      end
    end
    vim.lsp.buf.format({ async = false })
  end,
})

-- This lines verifies that lazy.nvim is installed for the sistem, if not it will clone it
-- taken from the lazy.nvim GitHub page https://github.com/lazy/lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Define the different configuration options for the lazy plugin
local opts = {
  defaults = {
    lazy = true, -- lazy load all the plugins by default
  },
}

-- will load all the plugins defined inside the /lua/plugins directory
require("lazy").setup("plugins", opts)
