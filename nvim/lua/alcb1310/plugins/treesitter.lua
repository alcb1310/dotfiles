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
                    'bash'
               },
          }

          vim.treesitter.language.register('markdown', 'octo')
     end,
}
