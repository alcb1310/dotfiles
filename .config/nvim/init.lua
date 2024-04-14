--
--
--                                              ###    ##        ######  ########
--                                             ## ##   ##       ##    ## ##     ##
--                                            ##   ##  ##       ##       ##     ##
--                                           ##     ## ##       ##       ########
--                                           ######### ##       ##       ##     ##
--                                           ##     ## ##       ##    ## ##     ##
--                                           ##     ## ########  ######  ########
--
--
--
--
--                                   ##    ## ########  #######  ##     ## #### ##     ##
--                                   ###   ## ##       ##     ## ##     ##  ##  ###   ###
--                                   ####  ## ##       ##     ## ##     ##  ##  #### ####
--                                   ## ## ## ######   ##     ## ##     ##  ##  ## ### ##
--                                   ##  #### ##       ##     ##  ##   ##   ##  ##     ##
--                                   ##   ### ##       ##     ##   ## ##    ##  ##     ##
--                                   ##    ## ########  #######     ###    #### ##     ##
--
--
--
--
--     ######   #######  ##    ## ######## ####  ######   ##     ## ########     ###    ######## ####  #######  ##    ##
--    ##    ## ##     ## ###   ## ##        ##  ##    ##  ##     ## ##     ##   ## ##      ##     ##  ##     ## ###   ##
--    ##       ##     ## ####  ## ##        ##  ##        ##     ## ##     ##  ##   ##     ##     ##  ##     ## ####  ##
--    ##       ##     ## ## ## ## ######    ##  ##   #### ##     ## ########  ##     ##    ##     ##  ##     ## ## ## ##
--    ##       ##     ## ##  #### ##        ##  ##    ##  ##     ## ##   ##   #########    ##     ##  ##     ## ##  ####
--    ##    ## ##     ## ##   ### ##        ##  ##    ##  ##     ## ##    ##  ##     ##    ##     ##  ##     ## ##   ###
--     ######   #######  ##    ## ##       ####  ######    #######  ##     ## ##     ##    ##    ####  #######  ##    ##
--
--

-- Defines space as the space leader, this should always be the first line of your configuration since it is used all
-- over the place
vim.g.mapleader = " "

vim.api.nvim_create_autocmd("BufWritePre", {
    desc = "Go imports on save",
    group = vim.api.nvim_create_augroup("goimports", { clear = true }),
    pattern = "*.go",
    callback = function()
        local params = vim.lsp.util.make_range_params()
        params.context = { only = { "source.organizeImports" } }
        local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params)
        for cid, res in pairs(result or {}) do
            for _, r in pairs(res.result or {}) do
                if r.edit then
                    local enc = (vim.lsp.get_client_by_id(cid) or {}).offset_encoding or "utf-16"
                    vim.lsp.util.apply_workspace_edit(r.edit, enc)
                end
            end
        end
        vim.lsp.buf.format({ async = false })
    end,
})

-- This lines verifies that lazy.nvim is installed for the sistem, if not it will clone it
-- taken from the lazy.nvim GitHub page https://github.com/lazy/lazy.nvim

local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

-- Define the different configuration options for the lazy plugin
local opts = {
    defaults = {
        lazy = true, -- lazy load all the plugins by default
    },
    change_detection = {
        notify = false,
    }
}

-- will load all the plugins defined inside the /lua/plugins directory
require("lazy").setup("plugins", opts)
require("keymaps")
require("options")
