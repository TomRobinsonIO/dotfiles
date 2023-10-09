local status_ok, ibl = pcall(require, "ibl")
if not status_ok then
  return
end

local icons = require "TomRobinsonIO.icons"

local highlight = {
    "nord15",
    "nord14",
    "nord13",
    "nord12",
    "nord11",
}
local hooks = require "ibl.hooks"
-- create the highlight groups in the highlight setup hook, so they are reset
-- every time the colorscheme changes
hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
    vim.api.nvim_set_hl(0, "nord7", { fg = "#8fbcbb" })
    vim.api.nvim_set_hl(0, "nord8", { fg = "#88c0d0" })
    vim.api.nvim_set_hl(0, "nord9", { fg = "#81a1c1" })
    vim.api.nvim_set_hl(0, "nord10", { fg = "#5e81ac" })
    vim.api.nvim_set_hl(0, "nord11", { fg = "#bf616a" })
    vim.api.nvim_set_hl(0, "nord12", { fg = "#d08770" })
    vim.api.nvim_set_hl(0, "nord13", { fg = "#ebcb8b" })
    vim.api.nvim_set_hl(0, "nord14", { fg = "#a3be8c" })
    vim.api.nvim_set_hl(0, "nord15", { fg = "#b48ead" })
end)

vim.g.rainbow_delimiters = { highlight = highlight }

ibl.setup{
    enabled = true,
    exclude  = {
        buftypes = {
            "terminal",
            "nofile",
        },
        filetypes = {
            "help",
            "startify",
            "dashboard",
            "lazy",
            "neogitstatus",
            "NvimTree",
            "Trouble",
            "text",
        },
    },
    indent = {
        char = {icons.ui.LineLeft},
        -- highlight = highlight,
    },
    scope = {
        enabled = true,
        show_start = true,
        highlight = highlight,
        include = {
            node_type = {
                ["*"] = { "*" }
            },
        },
    },
}

hooks.register(hooks.type.SCOPE_HIGHLIGHT, hooks.builtin.scope_highlight_from_extmark)
