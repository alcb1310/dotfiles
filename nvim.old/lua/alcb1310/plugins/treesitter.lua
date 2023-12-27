return {
     'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate',
     config = function()
          require('nvim-treesitter.configs').setup {
               ensure_installed = {
                    'http',
                    'json',
                    'vim',
                    'lua',
                    'bash',
                    "templ",
               },
               highlight = {
                    enable = true,
                    additional_vim_regex_highlighting = false,
               },
          }

          vim.treesitter.language.register('markdown', 'octo')
     end,
}
