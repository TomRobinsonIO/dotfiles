local o = vim.opt
local c = vim.cmd
local g = vim.g

o.showmode = false                -- we don't need to see things like -- INSERT -- anymore
o.relativenumber = true           -- Show the line number relative to the line with the cursor
o.number = true                   -- Show line numbering for current line
o.signcolumn = 'yes'              -- Always show sign column for warnings, errors, etc.
o.scrolloff = 8                   -- Start scrolling page when cursor is X lines from the bottom
o.sidescrolloff = 8               -- Start scrolling page when cursor is X lines from the side
o.smartindent = true              -- Indent smartly
o.expandtab = true                -- Converts tabs to spaces
o.tabstop = 4                     -- Insert 4 spaces for a tab
o.softtabstop = 4                 -- Insert 4 spaces for a tab
o.shiftwidth=4                    -- Number of spaces for each indent
o.termguicolors = true            -- Set terminal GUI colors
o.spell = true                    -- Enable spell checking
o.ignorecase = true               -- Make search case insensitive
o.smartcase = true                -- Make search case sensitive if searching with caps
o.wildmenu = true                 -- Enables "enhanced mode" of command-line completion
o.incsearch = true                -- While typing a search command, show where the pattern, as it was typed so far, matches
o.wrap = false                    -- Display lines as one long line

g["gruvbox_material_palette"] = "mix"
g["gruvbox_material_transparent_background"] = 1
g.catppuccin_flavor = "mocha"

c "set path+=**"                  -- Set path to include subfolders
c "set nohlsearch"                -- Turn of highlighting when search is done
c "set guicursor="                -- Don't change cursor when entering insert mode
c "colorscheme catppuccin"        -- gruvbox_material, dracula, catppuccin, nord
c "highlight Normal guibg=none"   -- Transparent background
c "highlight ColorColumn guibg=lightgrey"   -- Set line limit indicator color to lightgrey
