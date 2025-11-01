local servers = {
    "lua_ls",
    "cssls",
    "html",
    "marksman",
    "pyright",
    "bashls",
    "jsonls",
    "yamlls",
}

local settings = {
    ui = {
        border = "none",
        icons = {
            package_installed = "◍",
            package_pending = "◍",
            package_uninstalled = "◍",
        },
    },
    log_level = vim.log.levels.INFO,
    max_concurrent_installers = 4,
}

require("mason").setup(settings)
require("mason-lspconfig").setup({
    ensure_installed = servers,
    automatic_installation = true,
})

local opts = {}

for _, server in pairs(servers) do
    opts = {
        on_attach    = require("TomRobinsonIO.lsp.handlers").on_attach,
        capabilities = require("TomRobinsonIO.lsp.handlers").capabilities,
    }

    server = vim.split(server, "@")[1]

    local require_ok, conf_opts =
        pcall(require, "TomRobinsonIO.lsp.settings." .. server)
    if require_ok then
        opts = vim.tbl_deep_extend("force", conf_opts, opts)
    end

    vim.lsp.config(server, opts)

    vim.lsp.enable(server)
end
