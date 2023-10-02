require('caret').setup({
     options = {
          transparent = true,     -- Set to true to disable background setting
          inverted_signs = false, -- Controls inverted Signcolumn highlighting
          styles = {              -- Define styles for various syntax groups
               bold = true,
               italic = true,
               strikethrough = true,
               undercurl = true,
               underline = true,
          },
          inverse = { -- Determines inverse highlights for different types
               match_paren = false,
               visual = false,
               search = false,
          },
     },
     mapping = {           -- Configure key mappings
          toggle_bg = nil, -- Assign a specific key for toggling background
     },
     groups = {},
})

vim.cmd.colorscheme([[caret]])
vim.api.nvim_set_hl(0, "Normal", { bg = "none" })
vim.api.nvim_set_hl(0, "NormalFloat", { bg = "none" })
