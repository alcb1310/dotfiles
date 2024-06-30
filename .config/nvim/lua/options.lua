local opt = vim.opt

opt.number = true
opt.relativenumber = true

opt.cursorline = true     -- This will hightlight the line where the cursor is
opt.cursorcolumn = true   -- This will highlight the column where the cursor is

opt.termguicolors = true  -- Enables 24-bit RGB color int the TUI

opt.tabstop = 4           -- Defines the number of spaces that a <Tab> in the file couns for. The default is 8, I like using 2
opt.softtabstop = 4       -- Defines the number of spaces that a <Tab> counts while performing editing operations. The default is 0
opt.shiftwidth = 4        -- Defines the amount of whitespace used for one level of indentation, in columns
opt.expandtab = true      -- In insert mode, uses the appropiate number of spacies to insert a <Tab>, uses the tabstop value
opt.smartindent = true    -- When editing code, will smart autoindent when starting a new line
opt.autoindent = true     -- Copy the indent from the current line when starting a new line

opt.hlsearch = false      -- Highlights the previous search pattern, by default is true
opt.incsearch = true      -- While typing a search command, it hightights the pattern

opt.scrolloff = 8         -- Default value 0.  It is the number of lines to keep above and below the cursor making some context visible while moving around

-- TODO: explain what this lines do
opt.swapfile = false
opt.backup = false
-- opt.undodir = os.getenv("XDG_STATE_HOME") .. "/nvim/undodir"
opt.undofile = true

opt.wrap = false -- Default value true.  Setting to false so lines will not wrap

-- Disable netrw in favor of using oil.nvim instead
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

opt.mouse = "" -- Disable mouse support

