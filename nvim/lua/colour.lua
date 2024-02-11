local M = {}
M.augroup = vim.api.nvim_create_augroup(..., {})

local setup_autocmds = function()
    vim.api.nvim_clear_autocmds({ group = M.augroup })
end

local setup_opts = function()
    vim.cmd [[colorscheme selenized]]
    vim.o.termguicolors = true
end

function M.setup()
    setup_autocmds()
    setup_opts()

    require('darkman').setup()
end

return M
