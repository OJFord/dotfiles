local M = {}
M.augroup = vim.api.nvim_create_augroup(..., {})
M.leader = 't'

local setup_autocmds = function()
    vim.api.nvim_clear_autocmds({ group = M.augroup })
end

local setup_keymap = function()
    local builtin = require('telescope.builtin')

    vim.keymap.set('n', M.leader .. 'c', builtin.git_bcommits, {})

    vim.keymap.set('n', M.leader .. 'b', builtin.buffers, {})
    vim.keymap.set('n', '<C-B>', builtin.buffers, {})

    vim.keymap.set('n', M.leader .. 'f', builtin.live_grep, {})
    vim.keymap.set('n', '<C-F>', builtin.live_grep, {})
    vim.keymap.set('n', 'f', builtin.current_buffer_fuzzy_find, {})

    vim.keymap.set('n', M.leader .. 'p', builtin.find_files, {})
    vim.keymap.set('n', '<C-P>', builtin.find_files, {})

    vim.keymap.set('n', M.leader .. 'r', builtin.lsp_references, {})

    vim.keymap.set('n', M.leader .. 's', builtin.grep_string, {})
end

function M.setup()
    setup_autocmds()
    setup_keymap()

    local actions = require('telescope.actions')
    require('telescope').setup {
        defaults = {
            mappings = {
                i = {
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
        extensions = {
            fzf = {
            }
        }
    }

    require('telescope').load_extension('fzf')
end

return M
