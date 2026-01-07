local M = {}
M.augroup = vim.api.nvim_create_augroup(..., {})

local setup_autocmds = function()
    vim.api.nvim_clear_autocmds({ group = M.augroup })

    -- https://github.com/neovim/nvim-lspconfig/tree/master?tab=readme-ov-file#suggested-configuration
    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    vim.api.nvim_create_autocmd('LspAttach', {
        group = M.augroup,
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
            vim.keymap.set('n', '<Leader>f', M.format, opts)
        end,
    })
end

local setup_keymap = function()
    -- https://github.com/neovim/nvim-lspconfig/tree/master?tab=readme-ov-file#suggested-configuration
    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)

    M.coq_settings.keymap = {
        -- override conflicting defaults
        bigger_preview = "<C-S-P>",
        jump_to_mark = "<C-M>",
    }
end

local setup_opts = function()
    M.coq_settings.auto_start = "shut-up"
    M.coq_settings.xdg = true
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

local create_shellcheck_source = function(null_ls)
    return {
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
end

function M.setup()
    M.coq_settings = {}

    setup_autocmds()
    setup_keymap()
    setup_opts()

    require('trouble').setup({
        opts = {
            modes = {
                diagnostics = {
                    auto_open = true,
                    auto_close = true,
                },
            }
        }
    })

    local on_attach = function(client, bufnr)
        -- https://github.com/nvimtools/none-ls.nvim/wiki/Formatting-on-save#sync-formatting
        if client.supports_method("textDocument/formatting") then
            vim.api.nvim_create_autocmd("BufWritePre", {
                group = M.augroup,
                buffer = bufnr,
                callback = M.format,
            })
        end
    end

    local null_ls = require('null-ls')
    null_ls.setup({
        on_attach = on_attach,
        sources = {
            null_ls.builtins.diagnostics.fish,
            null_ls.builtins.formatting.fish_indent,

            null_ls.builtins.formatting.just,

            create_shellcheck_source(null_ls),
        },
    })

    -- https://github.com/neovim/nvim-lspconfig/blob/master/doc/configs.md
    local servers = {
        'eslint',
        'gopls',
        'lua_ls',
        'marksman',
        'pylsp',
        'rust_analyzer',
        'svelte',
        'sqlls',
        'terraformls',
        'texlab',
        'ts_ls',
        'vimls',
        'vuels',
    }
    vim.g.coq_settings = M.coq_settings
    local coq = require('coq')
    for _, lsp in ipairs(servers) do
        vim.lsp.config(lsp, {
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
        })
        vim.lsp.config(lsp, coq.lsp_ensure_capabilities())
        vim.lsp.enable(lsp)
    end
end

function M.format()
    local folds = require('folds')

    local view = vim.fn.winsaveview()
    local prior_open = folds.get_open()

    vim.lsp.buf.format({ async = false })

    folds.open_multi(prior_open)
    vim.fn.winrestview(view)
end

return M
