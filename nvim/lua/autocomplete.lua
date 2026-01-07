local M = {}
M.augroup = vim.api.nvim_create_augroup(..., {})

local setup_autocmds = function()
    vim.api.nvim_clear_autocmds({ group = M.augroup })
end

local setup_opts = function()
    vim.opt.completeopt = { 'longest', 'menuone' }
    vim.o.signcolumn = 'number' -- prevent resizing jitter
end

local setup_keymap = function()
    -- C-j/k completion navigation
    vim.cmd('inoremap <expr> <C-j> pumvisible() ? "\\<C-n>" : "j"')
    vim.cmd('inoremap <expr> <C-k> pumvisible() ? "\\<C-p>" : "k"')
    -- Enter to accept
    vim.cmd('inoremap <expr> <CR> pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"')
end

function M.setup()
    setup_autocmds()
    setup_keymap()
    setup_opts()
end

return M
