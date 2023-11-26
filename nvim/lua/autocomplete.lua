local coq = require('coq')

vim.opt.completeopt = {'longest', 'menuone'}
vim.o.signcolumn = 'number' -- prevent resizing jitter

local coq_settings = {
    keymap = {};
    xdg = true;
}

vim.api.nvim_create_autocmd('InsertEnter', {
    command = 'COQnow';
})

-- C-j/k completion navigation
coq_settings.keymap.bigger_preview = '<c-p>'
vim.cmd('inoremap <expr> <C-j> pumvisible() ? "\\<C-n>" : "j"')
vim.cmd('inoremap <expr> <C-k> pumvisible() ? "\\<C-p>" : "k"')
-- Enter to accept
vim.cmd('inoremap <expr> <CR> pumvisible() ? "\\<C-y>" : "\\<C-g>u\\<CR>"')

vim.g.coq_settings = coq_settings
