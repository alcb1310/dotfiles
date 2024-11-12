return {
  "ribelo/taskwarrior.nvim",
  event = "VimEnter",
  config = function()
    local task = require("taskwarrior_nvim")
    task.setup({
      filter = { "noice", "nofile" }, -- Filtered buffer_name and buffer_type.
      task_file_name = ".taskwarrior.json",
      -- After what period of time should a task be halted due to inactivity?
      granulation = 60 * 1000 * 10,
      notify_start = true, -- Should a notification pop up after starting the task?
      notify_stop = true,
      notify_error = true,
    })
    -- task.browser({ "ready" })

    vim.keymap.set("n", "<leader>a", function()
      task.add(vim.split(vim.fn.input("Custom command: ")))
    end, {})
    vim.keymap.set("n", "<leader>aa", function()
      task.browser({ "ready" })
    end, {})
    -- vim.keymap.set("n", "<M-d>", task.done, {})
    -- vim.keymap.set("n", "<M-s>", task.stop, {})
    -- vim.keymap.set("n", "<M-y>", vim.fn.setreg("+", task.uuid), {})
  end,
}
-- mappings = {
--   -- add task
--   ["<M-a>"] = taskwarrior.cmd({"add", unpack(vim.split(vim.fn.input("Custom command: "))))
--   ["<M-S-d>"] = task:delete
--   ["<M-d>"] = task:done
--   ["<M-s>"] = task:start or task:stop -- toggle
--   ["<M-y>"] = vim.fn.setreg("+", task.uuid) -- yank uid to default register
--   -- run custom command on task
--   ["<M-c>"] = task:cmd(vim.split(vim.fn.input("Custom command: ")))
--
