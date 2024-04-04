return {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  lazy = false,
  config = function()
    require("noice").setup({
      -- cmdline = {
      -- view = "cmdline",
      -- },
      routes = {
        {
          view = "cmdline",
          filter = { event = "msg_showmode" },
        },
      },
      views = {
        cmdline_popup = {
          border = {
            style = "none",
            padding = { 2, 3 },
          },
          filter_options = {},
          win_options = {
            winhighlight = { Normal = "NormalFloat", FloatBorder = "FloatBorder" },
          },
        },
      },
    })

    require("notify").setup({
      background_colour = "#000000",
    })
  end,
}
