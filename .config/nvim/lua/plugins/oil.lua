return {
  'stevearc/oil.nvim',
  cmd = 'Oil',
  opts = {
    default_file_explorer = true,
    columns = {
      'icon',
    },
    view_options = {
      show_hidden = false,

      is_hidden_file = function(name, _)
        return vim.startswith(name, '.')
      end,

      is_always_hidden = function(name, _)
        return vim.startswith(name, 'node_modules')
      end,
    },
    float = {
      -- Padding around the floating window
      padding = 2,
      max_width = 0,
      max_height = 0,
      border = "rounded",
      win_options = {
        winblend = 0,
      },
      -- This is the config that will be passed to nvim_open_win.
      -- Change values here to customize the layout
      override = function(conf)
        return conf
      end,
    },
    preview = {
      max_width = 0.9,
      min_width = { 40, 0.4 },

      max_height = 0.9,
      min_height = { 5, 0.4 },

      border = "rounded",
      win_options = {
        winblend = 0,
      }
    }
  },
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  }
}
