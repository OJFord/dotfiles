local coq = require('coq')
local lspconfig = require('lspconfig')
local null_ls = require('null-ls')
local trouble = require('trouble')

local augroup = vim.api.nvim_create_augroup("lsp", { clear = true })

trouble.setup({
    auto_open = true,
    auto_close = true,
})

local on_attach = function(client, bufnr)
    -- https://github.com/nvimtools/none-ls.nvim/wiki/Formatting-on-save#sync-formatting
    if client.supports_method("textDocument/formatting") then
        vim.api.nvim_create_autocmd("BufWritePre", {
            group = augroup,
            buffer = bufnr,
            callback = function()
                local view = vim.fn.winsaveview()
                vim.lsp.buf.format({ async = false })
                vim.fn.winrestview(view)
            end,
        })
    end
end

local function is_shell_script(filename)
    -- filename ext
    if filename:match("%.sh$") or filename:match("%.bash$") then return true end

    local file = io.open(filename, "r")
    if not file then return false end
    local first_line = file:read("*l")
    file:close()
    if not first_line then return false end

    -- shebang
    if first_line:match("^#!.*[ /]sh") ~= nil then return true end

    -- shellcheck directive
    if first_line:match("^# shellcheck") ~= nil then return true end

    return false
end

local shellcheck_source = {
    name = "shellcheck",
    method = { null_ls.methods.CODE_ACTIONS, null_ls.methods.DIAGNOSTICS },
    filetypes = {}, -- all, so we can run on ext-less executables too
    generator = {
        fn = function(params)
            if not is_shell_script(params.bufname) then
                return nil
            end

            if params.method == null_ls.methods.CODE_ACTIONS then
                return null_ls.builtins.code_actions.shellcheck._generator(params)
            end
            if params.method == null_ls.methods.DIAGNOSTICS then
                return null_ls.builtins.diagnostics.shellcheck._generator(params)
            end
        end
    }
}

null_ls.setup({
    on_attach = on_attach,
    sources = {
        null_ls.builtins.code_actions.eslint_d.with({ extra_filetypes = { 'svelte' } }),
        null_ls.builtins.diagnostics.eslint_d.with({ extra_filetypes = { 'svelte' } }),
        null_ls.builtins.formatting.eslint_d.with({ extra_filetypes = { 'svelte' } }),

        null_ls.builtins.diagnostics.fish,
        null_ls.builtins.formatting.fish_indent,

        null_ls.builtins.formatting.just,

        shellcheck_source,
    },
})

-- https://github.com/neovim/nvim-lspconfig/blob/master/doc/server_configurations.md
local servers = {
    'gopls',
    'lua_ls',
    'marksman',
    'pylsp',
    'rls',
    'svelte',
    'sqlls',
    'terraformls',
    'texlab',
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
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
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
    group = augroup,
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
        vim.keymap.set('n', 'tD', vim.lsp.buf.type_definition, opts)
        vim.keymap.set('n', '<Leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set({ 'n', 'v' }, '<Leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
        vim.keymap.set('n', '<Leader>f', function()
            vim.lsp.buf.format { async = true }
        end, opts)
    end,
})
