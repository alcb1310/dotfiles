local k = vim.keymap.set
return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	event = "BufEnter",
	dependencies = {
		"nvim-lua/plenary.nvim",
	},
	config = function()
		local harpoon = require("harpoon")

		-- REQUIRED
		harpoon:setup()
		-- REQUIRED

		k("n", "<leader>a", function()
			harpoon:list():append()
		end)
		k("n", "<C-e>", function()
			harpoon.ui:toggle_quick_menu(harpoon:list())
		end)

		k("n", "<leader>h", function()
			harpoon:list():select(1)
		end)
		k("n", "<leader>e", function()
			harpoon:list():select(2)
		end)
		k("n", "<leader>t", function()
			harpoon:list():select(3)
		end)
		k("n", "<leader>y", function()
			harpoon:list():select(4)
		end)

		-- Toggle previous & next buffers stored within Harpoon list
		-- k("n", "<C-S-P>", function()
		-- 	harpoon:list():prev()
		-- end)
		-- k("n", "<C-S-N>", function()
		-- 	harpoon:list():next()
		-- end)
	end,
}
