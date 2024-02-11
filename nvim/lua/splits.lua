local M = {}
M.augroup = vim.api.nvim_create_augroup(..., {})

local setup_autocmds = function()
    vim.api.nvim_clear_autocmds({ group = M.augroup })
end

local setup_opts = function()
    vim.o.splitbelow = true
    vim.o.splitright = true

    vim.o.winwidth = 80
    vim.o.winminwidth = 0
    vim.o.winminheight = 0
end

local setup_keymap = function()
    vim.keymap.set('n', '<C-J>', '<C-W><C-J>')
    vim.keymap.set('n', '<C-K>', '<C-W><C-K>')
    vim.keymap.set('n', '<C-L>', '<C-W><C-L>')
    vim.keymap.set('n', '<C-H>', '<C-W><C-H>')
end

function M.setup()
    setup_autocmds()
    setup_opts()
    setup_keymap()
end

return M
