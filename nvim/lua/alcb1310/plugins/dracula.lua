return {
     "Mofiqul/dracula.nvim",
     lazy = false,
     priority = 1000,
     config = function()
          vim.o.background = "dark"
          vim.cmd("colorscheme dracula")
     end
}
