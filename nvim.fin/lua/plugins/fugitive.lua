return {
     'tpope/vim-fugitive',
     -- lazy = false,
     cmd = { 'Git', 'G' },
     config = function()
          vim.keymap.set('n', '<leader>gs', ':Git<cr>')
     end
}
