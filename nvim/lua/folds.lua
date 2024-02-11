local augroup = vim.api.nvim_create_augroup("folds", { clear = true })

if vim.o.fillchars ~= '' then
    vim.o.fillchars = vim.o.fillchars .. ',fold: '
else
    vim.o.fillchars = 'fold: '
end

vim.o.foldmethod = 'syntax'
vim.cmd [[set foldopen-=block]]
vim.o.foldtext = "v:lua.custom_foldtext()"
_G.custom_foldtext = function()
    local size = vim.v.foldend - vim.v.foldstart + 1
    return vim.fn.getline(vim.v.foldstart) .. ' 󰁂' .. size
end

vim.api.nvim_create_autocmd({ "CursorHold", "BufWinEnter", "WinEnter" }, {
    group = augroup,
    callback = function()
        vim.cmd("AutoOrigamiFoldColumn")
    end
})

local foldopen = function()
    if vim.fn.foldclosed(vim.fn.line('.')) ~= -1 then
        vim.cmd('foldopen!')
    else
        return -1
    end
end

local foldtoggle = function()
    if vim.fn.foldlevel(vim.fn.line('.')) == 0 then
        return
    end

    if foldopen() == -1 then
        vim.cmd('foldclose')
    end
end

vim.api.nvim_create_autocmd({ "BufEnter" }, {
    group = augroup,
    callback = foldopen,
})
vim.keymap.set('n', '<Space>', foldtoggle)
