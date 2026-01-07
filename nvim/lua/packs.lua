local M = {}
M.augroup = vim.api.nvim_create_augroup(..., {})

local packs = {
    coq = {
        src = "gh:ms-jpq/coq_nvim",
        installVim = "COQdeps"
    },
    darkman = {
        src = "gh:4e554c4c/darkman.nvim",
        installSys = "go build -o bin/darkman.nvim",
    },
    lspconfig = {
        src = "gh:neovim/nvim-lspconfig",
    },
    ["none-ls"] = {
        src = "gh:nvimtools/none-ls.nvim",
    },
    plenary = {
        src = "gh:nvim-lua/plenary.nvim",
    },
    telescope = {
        src = "gh:nvim-telescope/telescope.nvim",
    },
    ["telescope-fzf-native"] = {
        src = "gh:nvim-telescope/telescope-fzf-native.nvim",
        installSys = "cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release --target install",
    },
    trouble = {
        src = "gh:folke/trouble.nvim",
    },
    ["web-devicons"] = {
        src = "gh:nvim-tree/nvim-web-devicons",
    },
}

local setup_autocmds = function()
    vim.api.nvim_clear_autocmds({ group = M.augroup })

    vim.api.nvim_create_autocmd({ "PackChanged" }, {
        group = M.augroup,
        callback = function(ev)
            local packName, kind = ev.data.spec.name, ev.data.kind
            if not (kind == 'install' or kind == 'update') then
                return
            end

            local installSys, installVim = packs[packName].installSys, packs[packName].installVim

            if installSys ~= nil then
                print(string.format("Running install command for %s in %s: %s", packName, ev.data.path, installSys))
                vim.system({"bash", "-c", installSys}, { cwd = ev.data.path }):wait()
            end
            if installVim ~= nil then
                print(string.format("Running install function for %s: %s", packName, installVim))
                vim.cmd("packadd "..packName)
                vim.cmd(installVim)
            end
        end
    })
end

function M.setup()
    setup_autocmds()

    local packAddList = {}
    for name, opts in pairs(packs) do
        local pack = vim.deepcopy(opts)
        pack.install = nil
        pack.name = name
        table.insert(packAddList, pack)
    end
    vim.pack.add(packAddList)
end

return M
