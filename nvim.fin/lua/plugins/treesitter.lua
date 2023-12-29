local config = function()
     require("nvim-treesitter.configs").setup({
          ensure_installed = {
               "bash",
               "c",
               "lua",
               "vim",
               "vimdoc",
               "go",
               "http",
               "json",
               "markdown",
               "markdown_inline",
               "gitignore",
          },
          auto_install = true,
          highlight = {
               enable = true,
               additional_vim_regex_highlighting = false,
          },
     })
end

return {
     'nvim-treesitter/nvim-treesitter',
     run = ':TSUpdate',
     lazy = false,
     config = config
}
