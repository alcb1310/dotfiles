return {
     'uga-rosa/ccc.nvim',
     lazy = true,
     ft = { "css", "scss", "html", "templ", "markdown" },
     config = function()
          local ccc = require("ccc")
          require('ccc').setup({
               pickers = {
                    -- Default colors came from Campbell (WindowsTerminal)
                    ccc.picker.ansi_escape(),
               },
               highlighter = {
                    auto_enable = true
               },
          })

          vim.keymap.set("n", "<leader>sc", ":CccHighlighterToggle<cr>", { silent = true })
     end
}
