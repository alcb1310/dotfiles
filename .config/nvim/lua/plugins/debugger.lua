return {
  "mfussenegger/nvim-dap",
  dependencies = {
    "rcarriga/nvim-dap-ui",
    "theHamsta/nvim-dap-virtual-text",
    "leoluz/nvim-dap-go",
    "nvim-telescope/telescope-dap.nvim",
    "nvim-neotest/nvim-nio",
    -- "microsoft/vscode-js-debug",
  },
  keys = {
    { "<leader>dt", "<cmd>lua require'dap'.toggle_breakpoint()<cr>", desc = "Toggle breakpoint" },
    { "<leader>dc", "<cmd>lua require'dap'.continue()<cr>",          desc = "Continue" },
    { "<leader>di", "<cmd>lua require'dap'.step_into()<cr>",         desc = "Step into" },
    { "<leader>do", "<cmd>lua require'dap'.step_over()<cr>",         desc = "Step over" },
    { "<leader>dO", "<cmd>lua require'dap'.step_out()<cr>",          desc = "Step out" },
    { "<leader>dr", "<cmd>lua require'dap'.repl.open()<cr>",         desc = "Open REPL" },
    { "<leader>dl", "<cmd>lua require'dap'.run_last()<cr>",          desc = "Run last" },
    { "<leader>td", "<cmd>lua require'dap-go'.debug_test()<cr>",     desc = "Debug test" },
  },
  config = function()
    local dap, dapui = require("dap"), require("dapui")
    dapui.setup({
      icons = { expanded = "▾", collapsed = "▸" },
      layouts = {
        {
          elements = {
            "breakpoints",
            "stacks",
            "watches",
            "scopes",
          },
          size = 60,
          position = "left",
        },
        {
          elements = {
            "repl",
            "console",
          },
          size = 10,
          position = "bottom",
        },
      },
    })
    require("dap-go").setup()
    require("nvim-dap-virtual-text").setup()

    local ok_neotest, neotest = pcall(require, "neotest")
    if ok_neotest then
      neotest.setup({
        adapters = {
          require("neotest-go"),
          require("neotest-jest"),
        },
      })
    end

    -- local adapter = nil
    -- local adapters = { "lldb-dap", "codelldb" }
    -- for _, ad in pairs(adapters) do
    --   if vim.fn.executable(ad) == 1 then
    --     adapter = ad
    --     break
    --   end
    -- end

    -- if adapter ~= nil then
    dap.adapters.lldb = {
      type = "executable",
      command = "lldb-dap",
      name = "lldb",
    }
    dap.configurations.cpp = {
      {
        type = "lldb",
        name = "launch",
        request = "launch",
        program = function()
          local dir = vim.fn.getcwd()
          return dir .. "/target/debug/" .. vim.fs.basename(dir)
          -- return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = function()
          return vim.fn.split(vim.fn.input("Arguments: "), "")
        end,
      },
      {
        name = "custom",
        type = "lldb",
        request = "launch",
        program = function()
          return vim.fn.input("Path to executable: ", vim.fn.getcwd() .. "/", "file")
        end,
        cwd = "${workspaceFolder}",
        stopOnEntry = false,
        args = function()
          return vim.fn.split(vim.fn.input("Arguments: "), "")
        end,
      },
    }
    -- end

    local ok_telescope, telescope = pcall(require, "telescope")
    if ok_telescope then
      telescope.load_extension("dap")
    end

    -- Eval var under cursor
    vim.keymap.set("n", "<space>?", function()
      require("dapui").eval(nil, { enter = true })
    end)

    dap.listeners.before.attach.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.launch.dapui_config = function()
      dapui.open()
    end
    dap.listeners.before.event_terminated.dapui_config = function()
      dapui.close()
    end
    dap.listeners.before.event_exited.dapui_config = function()
      dapui.close()
    end
  end,
}
