local M = {}
M.augroup = vim.api.nvim_create_augroup(..., {})
M.leader = 't'

local setup_autocmds = function()
    vim.api.nvim_clear_autocmds({ group = M.augroup })
end

local setup_keymap = function()
    local builtin = require('telescope.builtin')

    local function find_in_files()
        builtin.grep_string({
            path_display = { 'smart' },
            only_sort_text = true,
            search = '', -- behave like `builtin.live_grep`, but enables fzf ext
        })
    end

    vim.keymap.set('n', M.leader .. 'c', builtin.git_bcommits, { nowait = true })
    vim.keymap.set('n', M.leader .. 'b', builtin.buffers, { nowait = true })
    vim.keymap.set('n', M.leader .. 'f', find_in_files, { nowait = true })
    vim.keymap.set('n', M.leader .. 'p', builtin.find_files, { nowait = true })
    vim.keymap.set('n', M.leader .. 'r', builtin.lsp_references, { nowait = true })
end

function M.setup()
    setup_autocmds()
    setup_keymap()

    local actions = require('telescope.actions')
    local telescope = require('telescope')
    telescope.setup {
        defaults = {
            initial_mode = 'insert',
            mappings = {
                i = {
                    ["<esc>"] = actions.close,
                    ["<C-j>"] = actions.move_selection_next,
                    ["<C-k>"] = actions.move_selection_previous,
                    ["<C-h>"] = actions.results_scrolling_left,
                    ["<C-l>"] = actions.results_scrolling_right,
                    ["<C-S-h>"] = actions.preview_scrolling_left,
                    ["<C-S-l>"] = actions.preview_scrolling_right,
                    ["<C-S-k>"] = actions.preview_scrolling_up,
                    ["<C-S-j>"] = actions.preview_scrolling_down,
                },
            },
        },
    }

    telescope.load_extension('fzf')
end

return M
