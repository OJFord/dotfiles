if vim.o.fillchars ~= '' then
    vim.o.fillchars = vim.o.fillchars .. ',fold: '
else
    vim.o.fillchars = 'fold: '
end

vim.o.foldtext = "v:lua.custom_foldtext()"
_G.custom_foldtext = function()
    local size = vim.v.foldend - vim.v.foldstart + 1
    return vim.fn.getline(vim.v.foldstart) .. ' 󰁂' .. size
end
