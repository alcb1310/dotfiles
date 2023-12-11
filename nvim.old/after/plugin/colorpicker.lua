local ccc = require("ccc")

ccc.setup({
     pickers = {
          -- Default colors came from Campbell (WindowsTerminal)
          ccc.picker.ansi_escape(),
          ccc.picker.custom_entries({
               red = "#BF616A",
               green = "#A3BE8C",
               blue = "#81A1C1",
          })
     },
     highlighter = {
          auto_enable = true
     },
})

vim.keymap.set("n", "<leader>sc", ":CccHighlighterToggle<cr>", { silent = true })
