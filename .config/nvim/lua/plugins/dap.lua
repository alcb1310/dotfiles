return {
    "mfussenegger/nvim-dap",
    dependencies = {
        "rcarriga/nvim-dap-ui",
        "leoluz/nvim-dap-go", -- Go debugging
    },
    lazy = false,
    config = function()
        local dap, dapui = require("dap"), require("dapui")

        -- Setup functions
        require("dap-go").setup() -- Enable Go debugging

        -- Setup UI
        dapui.setup()

        -- Debug Keymaps
        vim.keymap.set("n", "<leader>dt", function() dap.toggle_breakpoint() end,
            { desc = "Toggle breakpoint", silent = true })
        vim.keymap.set("n", "<leader>dc", function() dap.continue() end,
            { desc = "Continue debugging", silent = true })
        vim.keymap.set("n", "<leader>do", function() dap.step_over() end,
            { desc = "Step over", silent = true })
        vim.keymap.set("n", "<leader>di", function() dap.step_into() end,
            { desc = "Step into", silent = true })

        -- Debug UI
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
