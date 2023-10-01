local ensure_packer = function()
     local fn = vim.fn
     local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
     if fn.empty(fn.glob(install_path)) > 0 then
          fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
          vim.cmd [[packadd packer.nvim]]
          return true
     end
     return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
     use 'wbthomason/packer.nvim'

     use 'tpope/vim-fugitive'
     use 'projekt0n/caret.nvim'
     use 'theprimeagen/harpoon'
     use 'christoomey/vim-tmux-navigator'
     use 'nvim-tree/nvim-web-devicons'
     use 'prichrd/netrw.nvim'
     use 'lewis6991/gitsigns.nvim'

     use {
          'nvim-telescope/telescope.nvim', tag = '0.1.3',
          -- or                            , branch = '0.1.x',
          requires = { { 'nvim-lua/plenary.nvim' } }
     }

     use('nvim-treesitter/nvim-treesitter', { run = ':TSUpdate' })
     use {
          'folke/noice.nvim',
          requires = {
               'MunifTanjim/nui.nvim',
               'rcarriga/nvim-notify',
          }
     }

     use {
          'VonHeikemen/lsp-zero.nvim',
          branch = 'v2.x',
          requires = {
               -- LSP Support
               { 'neovim/nvim-lspconfig' },
               { 'williamboman/mason.nvim' },
               { 'williamboman/mason-lspconfig.nvim' },

               -- Autocompletion
               { 'hrsh7th/nvim-cmp' },
               { 'hrsh7th/cmp-buffer' },
               { 'hrsh7th/cmp-path' },
               { 'saadparwaiz1/cmp_luasnip' },
               { 'hrsh7th/cmp-nvim-lsp' },
               { 'hrsh7th/cmp-nvim-lua' },

               -- Snippets
               { 'L3MON4D3/LuaSnip' },
               { 'rafamadriz/friendly-snippets' },
          }
     }

     use {
          "rest-nvim/rest.nvim",
          requires = { "nvim-lua/plenary.nvim" },
          config = function()
               require("rest-nvim").setup({
                    -- Open request results in a horizontal split
                    result_split_horizontal = false,
                    -- Keep the http file buffer above|left when split horizontal|vertical
                    result_split_in_place = false,
                    -- Skip SSL verification, useful for unknown certificates
                    skip_ssl_verification = false,
                    -- Encode URL before making request
                    encode_url = true,
                    -- Highlight request on run
                    highlight = {
                         enabled = true,
                         timeout = 150,
                    },
                    result = {
                         -- toggle showing URL, HTTP info, headers at top the of result window
                         show_url = true,
                         -- show the generated curl command in case you want to launch
                         -- the same request via the terminal (can be verbose)
                         show_curl_command = false,
                         show_http_info = true,
                         show_headers = true,
                         -- executables or functions for formatting response body [optional]
                         -- set them to false if you want to disable them
                         formatters = {
                              json = "jq",
                              html = function(body)
                                   return vim.fn.system({ "tidy", "-i", "-q", "-" }, body)
                              end
                         },
                    },
                    -- Jump to request line on run
                    jump_to_request = false,
                    env_file = '.env',
                    custom_dynamic_variables = {},
                    yank_dry_run = true,
               })
          end
     }

     -- Automatically set up your configuration after cloning packer.nvim
     -- Put this at the end after all plugins
     if packer_bootstrap then
          require('packer').sync()
     end
end)
