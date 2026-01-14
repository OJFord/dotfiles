---@type vim.lsp.Config
return {
    settings = {
        Lua = {
            diagnostics = {
                globals = {
                    'vim',
                },
            },
            workspace = {
                library = vim.env.VIMRUNTIME,
            },
            runtime = {
                version = 'LuaJIT',
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
            telemetry = {
                enable = false,
            },
        },
    },
}
