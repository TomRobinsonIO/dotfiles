local status_ok, bufferline = pcall (require, "bufferline")
if not status_ok then
    return
end

local icons = require "TomRobinsonIO.icons"

bufferline.setup{
    options = {
        indicator = { icon = icons.ui.LineLeft, style = "icon" },
        offsets = { { filetype = "NvimTree", text = "", padding = 1 } },
        truncate_names = true,
    },
}
