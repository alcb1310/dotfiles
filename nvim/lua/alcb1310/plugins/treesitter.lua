local M = {
     'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate',
     opts = {
          ensure_installed = {
               'http',
               'json',
               'vim',
               'lua',
               'bash'
          },
     },
}

return M
