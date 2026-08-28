-- Setup which-key.nvim
local status_ok, which_key = pcall(require, "which-key")
if not status_ok then
    return
end

-- Configure which-key
which_key.setup {
    -- Show delay before popup appears
    delay = function(ctx)
        return ctx.plugin and 0 or 200
    end,

    -- Preset style: "classic", "modern", "helix", or false
    preset = "classic",

    -- Icons configuration
    icons = {
        breadcrumb = "»",
        separator = "➜",
        group = "+",
        ellipsis = "…",
    },

    -- Layout settings
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "center",
    },

    -- Show help text in popup
    show_help = true,

    -- Built-in plugins to enable
    plugins = {
        marks = true,
        registers = true,
        spelling = true,
        presets = {
            operators = true,
            motions = true,
            text_objects = true,
            windows = true,
            nav = true,
            z = true,
            g = true,
        },
    },
}

-- Register the keymap for buffer local keymaps
vim.keymap.set("n", "<leader>?", function()
    require("which-key").show({ global = false })
end, { desc = "Buffer Local Keymaps (which-key)", silent = true })
