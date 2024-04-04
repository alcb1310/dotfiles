return {
  {
    "nvim-telescope/telescope.nvim",
    tag = "0.1.6",
    lazy = false,
    opts = {
      defaults = {
        layout_config = {
          prompt_position = "top",
        },
      },
    },
    config = function(_, opts)
      require("telescope").load_extension("ui-select")
      require("telescope").setup(opts)

      local builtin = require("telescope.builtin")
      vim.keymap.set("n", "<leader>ff", builtin.find_files, {})
      vim.keymap.set("n", "<leader>fg", builtin.live_grep, {})
      vim.keymap.set("n", "<leader>fb", builtin.buffers, {})
      vim.keymap.set("n", "<leader>fh", builtin.help_tags, {})
    end,
    dependencies = {
      {
        "nvim-lua/plenary.nvim",
      },
    },
  },
  {
    "nvim-telescope/telescope-ui-select.nvim",
  },
}
