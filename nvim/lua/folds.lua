local M = {}
M.augroup = vim.api.nvim_create_augroup(..., {})

local setup_autocmds = function()
    vim.api.nvim_clear_autocmds({ group = M.augroup })

    vim.api.nvim_create_autocmd({ "CursorHold", "BufWinEnter", "WinEnter" }, {
        group = M.augroup,
        callback = function()
            vim.cmd("AutoOrigamiFoldColumn")
        end
    })

    vim.api.nvim_create_autocmd({ "BufEnter" }, {
        group = M.augroup,
        callback = M.foldopen,
    })
end

local setup_keymap = function()
    vim.keymap.set('n', '<Space>', M.foldtoggle)
end

local setup_opts = function()
    vim.opt.fillchars:append { fold = ' ' }
    vim.o.foldmethod = 'syntax'
    vim.cmd [[set foldopen-=block]]
    vim.o.foldtext = 'v:lua.require("folds").foldtext()'
end

function M.setup()
    setup_autocmds()
    setup_keymap()
    setup_opts()
end

function M.foldopen()
    if vim.fn.foldclosed(vim.fn.line('.')) ~= -1 then
        vim.cmd('foldopen!')
    else
        return -1
    end
end

function M.foldtext()
    local size = vim.v.foldend - vim.v.foldstart + 1
    return vim.fn.getline(vim.v.foldstart) .. ' 󰁂' .. size
end

function M.foldtoggle()
    if vim.fn.foldlevel(vim.fn.line('.')) == 0 then
        return
    end

    if M.foldopen() == -1 then
        vim.cmd('foldclose')
    end
end

function M.get_open()
    local open = {}
    for line = 1, vim.fn.line('$') do
        if vim.fn.foldlevel(line) > 0 and vim.fn.foldclosed(line) == -1 then
            table.insert(open, line)
        end
    end
    return open
end

function M.open_multi(lines)
    for _, line in ipairs(lines) do
        -- check still closed because it might have opened with previous line
        if vim.fn.foldclosed(line) ~= -1 then
            vim.cmd(tostring(line) .. 'foldopen')
        end
    end
end

return M
