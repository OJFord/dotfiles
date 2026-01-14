---@type vim.lsp.Config
return {
    settings = {
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
    },
}
