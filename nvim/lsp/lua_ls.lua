---@type vim.lsp.Config
return {
    on_init = function(client)
        if client.workspace_folders then
            local path = client.workspace_folders[1].name
            if path ~= vim.fn.stdpath('config') then -- not nvim
                return
            end
        end

        client.config.settings.Lua = vim.tbl_deep_extend('force', client.config.settings.Lua, {
            diagnostics = {
                globals = {
                    'vim',
                },
            },
            workspace = {
                checkThirdParty = false,
                library = vim.env.VIMRUNTIME,
            },
            runtime = {
                version = 'LuaJIT',
                path = {
                    'lua/?.lua',
                    'lua/?/init.lua',
                },
            },
        })
    end,
    root_markers = {'init.vim', 'lua'},
    settings = {
        Lua = {
            telemetry = {
                enable = false,
            },
        },
    },
}
