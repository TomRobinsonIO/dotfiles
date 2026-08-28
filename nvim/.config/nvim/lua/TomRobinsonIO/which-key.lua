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

    -- Window appearance
    window = {
        border = "single",
        position = "bottom",
        margin = { 1, 0, 1, 0 },
        padding = { 2, 2, 2, 2 },
        winblend = 0,
        zindex = 1000,
    },

    -- Layout settings
    layout = {
        height = { min = 4, max = 25 },
        width = { min = 20, max = 50 },
        spacing = 3,
        align = "center",
    },

    -- Key labels customization
    key_labels = {},

    -- Hide certain patterns from display
    hidden = { "<silent>", "<cmd>", "<Cmd>", "<CR>", "call", "lua", "^:" },

    -- Show help text in popup
    show_help = true,

    -- Automatic trigger detection
    triggers = "auto",

    -- Disable triggering in specific modes/keys
    triggers_blacklist = {
        i = { "j", "k" },
        v = { "j", "k" },
    },

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
