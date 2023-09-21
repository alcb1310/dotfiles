require('telescope').setup {
     extensions = {
          extension_name = {
               'nvim-telescope/telescope-dap.nvim'
          }
     }
}

require('telescope').load_extension('dap')
local M = {}

local last_cmd = ""

M.debug_cmd = function()
     -- fills in the last used cmd, use <Ctrl-U> to remove
     local cmd = vim.fn.input("DAP launch cmd: ", last_cmd)
     if cmd == "" then return end

     last_cmd = cmd

     local program = nil
     local args = nil
     -- NOTE: this assumes no spaces in the program nor arguments!
     local splits = vim.split(cmd, " ")
     if #splits > 0 then
          program = splits[1]
          if #splits > 1 then
               table.remove(splits, 1)
               args = splits
          end
     end

     local config = {
          name = "cpp_launch",
          type = "lldb",
          request = "launch",
          program = program,
          cwd = '${workspaceFolder}',
          stopOnEntry = false,
          args = args,
          runInTerminal = false,
     }
     local dap = require('dap')
     dap.run(config)
end

vim.api.nvim_set_keymap('n', '<leader>dar', '<cmd>lua require"user.plugins.dap".debug_cmd()<CR>',
     { noremap = true, silent = true })

return M
