local coq = require('coq')
local lspconfig = require('lspconfig')
local null_ls = require('null-ls')

local augroup_lspformat = vim.api.nvim_create_augroup("LspFormatting", {})
local on_attach = function(client, bufnr)
    -- https://github.com/nvimtools/none-ls.nvim/wiki/Formatting-on-save#sync-formatting
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_clear_autocmds({ group = augroup_lspformat, buffer = bufnr })
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup_lspformat,
            buffer = bufnr,
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })
    end
end

null_ls.setup({
    on_attach = on_attach,
    sources = {
        null_ls.builtins.code_actions.eslint_d.with({ extra_filetypes = { 'svelte' } }),
        null_ls.builtins.diagnostics.eslint_d.with({ extra_filetypes = { 'svelte' } }),
        null_ls.builtins.formatting.eslint_d.with({ extra_filetypes = { 'svelte' } }),
    },
})

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
    'gopls',
    'lua_ls',
    'pylsp',
    'rls',
    'svelte',
    'sqlls',
    'terraformls',
    'tsserver',
    'vimls',
    'vuels',
}
for _, lsp in ipairs(servers) do
    lspconfig[lsp].setup(coq.lsp_ensure_capabilities({
        on_attach = on_attach,
        settings = {
            Lua = {
                diagnostics = {
                    globals = {
                        'vim',
                    },
                },
                workspace = {
                    library = vim.api.nvim_get_runtime_file("", true),
                },
                telemetry = {
                    enable = false,
                },
            },
            pylsp = {
                plugins = {
                    pylint = {
                        enabled = true,
                    },
                    pylsp_black = {
                        enabled = true,
                    },
                    pylsp_mypy = {
                        enabled = true,
                        live_mode = true,
                    },
                    yapf = {
                        enabled = false,
                    },
                },
            },
            rust = {
                clippy_preference = "on",
            },
        },
    }))
end

-- Below here is the 'suggested configuration':
-- https://github.com/neovim/nvim-lspconfig/tree/master?tab=readme-ov-file#suggested-configuration

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.g.coq_settings = {
    -- override conflicting defaults
    keymap = {
        bigger_preview = "<C-S-P>",
        jump_to_mark = "<C-M>",
    },
}

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('UserLspConfig', {}),
    callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local opts = { buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, opts)
        vim.keymap.set('n', '<space>wl', function()
            print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<space>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
