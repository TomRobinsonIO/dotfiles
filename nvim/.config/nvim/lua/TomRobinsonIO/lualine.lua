local status_ok, lualine = pcall(require, "lualine") if not status_ok then
    print('lualine broke')
  return
end

local status_navic_ok, navic = pcall(require, "nvim-navic")
if not status_navic_ok then
    print('navic broke')
  return
end

local hide_in_width = function()
  return vim.fn.winwidth(0) > 80
end

local icons = require "TomRobinsonIO.icons"

local diagnostics = {
  "diagnostics",
  sources = { "nvim_diagnostic" },
  sections = { "error", "warn" },
  symbols = { error = icons.diagnostics.Error .. " ", warn = icons.diagnostics.Warning .. " " },
  colored = false,
  update_in_insert = false,
  always_visible = true,
}

local diff = {
  "diff",
  colored = false,
  symbols = { added = icons.git.Add .. " ", modified = icons.git.Mod .. " ", removed = icons.git.Remove .. " " }, -- changes diff symbols
  cond = hide_in_width,
}

local mode = {
   "mode",
   fmt = function(str)
    return str --:sub(1,1)
   end,
 }

local filetype = {
  "filetype",
  icons_enabled = true,
}

local branch = {
  "branch",
  icons_enabled = true,
  icon = "",
}

local location = {
  "location",
  padding = 0,
}

-- cool function for progress
local progress = function()
  local current_line = vim.fn.line "."
  local total_lines = vim.fn.line "$"
  local chars = { "__", "▁▁", "▂▂", "▃▃", "▄▄", "▅▅", "▆▆", "▇▇", "██" }
  local line_ratio = current_line / total_lines
  local index = math.ceil(line_ratio * #chars)
  return chars[index]
end

local spaces = function()
  return "spaces: " .. vim.api.nvim_get_option_value("shiftwidth", { buf = 0 })
end

local nvim_navic = function()
  local navic_location = navic.get_location()
  if navic_location == "error" then
    return ""
  else
    return navic.get_location()
  end
end

require ('lualine').setup {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
    disabled_filetypes = { "alpha", "dashboard", "NvimTree", "Outline", "toggleterm" },
    always_divide_middle = true,
  },
  sections = {
    lualine_a = { mode },
    lualine_b = { "branch", "diagnostics" },
    lualine_c = { 
        {"filename"},
      { nvim_navic, cond = hide_in_width },
    },
    lualine_x = { diff, spaces, "encoding", filetype },
    lualine_y = { progress },
    lualine_z = { location },
  },
  inactive_sections = {
    lualine_a = {},
    lualine_b = {},
    lualine_c = {},
    lualine_x = { "location" },
    lualine_y = {},
    lualine_z = {},
  },
  tabline = {},
  extensions = {},
}
