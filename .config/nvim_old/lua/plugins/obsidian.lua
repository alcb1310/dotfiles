return {
    "epwalsh/obsidian.nvim",
    lazy = true,
    version = "*", -- recommended, use latest release instead of latest commit
    command = {
        "ObsidianToggle",
        "ObsidianNew",
    },
    ft = "markdown",
    -- Replace the above line with this if you only want to load obsidian.nvim for markdown files in your vault:
    -- event = {
    --   -- If you want to use the home shortcut '~' here you need to call 'vim.fn.expand'.
    --   -- E.g. "BufReadPre " .. vim.fn.expand "~" .. "/my-vault/**.md"
    --   "BufReadPre path/to/my-vault/**.md",
    --   "BufNewFile path/to/my-vault/**.md",
    -- },
    dependencies = {
        -- Required.
        "nvim-lua/plenary.nvim",

        -- see below for full list of optional dependencies 👇
    },
    opts = {
        workspaces = {
            {
                name = "personal",
                path = "~/notes/alcb1310",
            },
        },
        mappings = {
            ["<leader>on"] = {
                action = function()
                    return require("obsidian").new_note()
                end,
                opts = {
                    silent = true,
                    desc = "Open New Obsidian Note",
                },
            },
        },
        follow_url_func = function(url)
            vim.fn.jobstart("open", url)
        end,
        picker = {
            mappings = {
                new = "<C-a>",
            },
            name = "telescope.nvim",
        },

        -- see below for full list of options 👇
    },
}
