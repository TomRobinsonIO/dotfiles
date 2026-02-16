local o = vim.opt
local c = vim.cmd
local g = vim.g

-- o.clipboard = "unnamedplus"       -- allows neovim to access the system clipboard
o.cursorline = true               -- Highlight line cursor is currently on
o.expandtab = true                -- Converts tabs to spaces
o.ignorecase = true               -- Make search case insensitive
o.incsearch = true                -- While typing a search command, show where the pattern, as it was typed so far, matches
o.list = true
o.number = true                   -- Show line numbering for current line
o.relativenumber = true           -- Show the line number relative to the line with the cursor
o.scrolloff = 8                   -- Start scrolling page when cursor is X lines from the bottom
o.shiftwidth=4                    -- Number of spaces for each indent
o.showmode = false                -- we don't need to see things like -- INSERT -- anymore
o.sidescrolloff = 8               -- Start scrolling page when cursor is X lines from the side
o.signcolumn = 'yes'              -- Always show sign column for warnings, errors, etc.
o.smartcase = true                -- Make search case sensitive if searching with caps
o.smartindent = true              -- Indent smartly
o.softtabstop = 4                 -- Insert 4 spaces for a tab
o.spell = true                    -- Enable spell checking
o.tabstop = 4                     -- Insert 4 spaces for a tab
o.termguicolors = true            -- Set terminal GUI colors
o.wildmenu = true                 -- Enables "enhanced mode" of command-line completion
o.wrap = false                    -- Display lines as one long line
o.winborder = 'rounded'           -- Floating window borders rounded

g["gruvbox_material_palette"] = "mix"
g["gruvbox_material_transparent_background"] = 1
g.catppuccin_flavour = "mocha"

c "colorscheme catppuccin"        -- gruvbox-material, dracula, catppuccin, nord
c "hi colorcolumn guibg=#89b4fa"  -- Set the colorcolumn color to catppuccin blue #89b4fa, gruvbox blue #458588
c "set guicursor="                -- Don't change cursor when entering insert mode
c "set nohlsearch"                -- Turn of highlighting when search is done
c "set path+=**"                  -- Set path to include subfolders
-- c "highlight Normal guibg=none"   -- Transparent background
-- c "highlight ColorColumn guibg=lightgrey"   -- Set line limit indicator color to lightgrey
