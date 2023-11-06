local opts = { noremap = true, silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap("", "<Space>", "<Nop>", opts)
vim.g.mapleader = " "

-- Modes
--  normal = "n"
--  insert = "i"
--  visual = "v"
--  visual_block = "x"
--  term = "t"
--  command = "c"

-- Normal Maps --
-- Space hjkl moves between splits
keymap("n", "<leader>h", "<C-w>h", opts)
keymap("n", "<leader>j", "<C-w>j", opts)
keymap("n", "<leader>k", "<C-w>k", opts)
keymap("n", "<leader>l", "<C-w>l", opts)

-- Create new splits
keymap("n", "<leader>sv", ":vsplit <CR>", opts)
keymap("n", "<leader>sh", ":split <CR>", opts)

-- Navigate buffers
keymap("n", "<S-l>", ":bnext<CR>", opts)
keymap("n", "<S-h>", ":bprevious<CR>", opts)

-- Copy Paste to System Clipboard
keymap("n", "<leader>y", '"+y', opts)
keymap("n", "<leader>p", '"+p', opts)

-- Page Up/Down Center Cursor
keymap("n", "<C-d>", "<C-d>zz", opts)
keymap("n", "<C-u>", "<C-u>zz", opts)

-- Resize with space + arrows
keymap("n", "<C-Up>", ":resize +2<CR>", opts)
keymap("n", "<C-Down>", ":resize -2<CR>", opts)
keymap("n", "<C-Left>", ":vertical resize -2<CR>", opts)
keymap("n", "<C-Right>", ":vertical resize +2<CR>", opts)

if vim.fn.has "mac" == 1 then
    keymap("n", "<A-Up>", ":resize +2<CR>", opts)
    keymap("n", "<A-Down>", ":resize -2<CR>", opts)
    keymap("n", "<A-Left>", ":vertical resize -2<CR>", opts)
    keymap("n", "<A-Right>", ":vertical resize +2<CR>", opts)
end


-- Open NetRW to the left
-- keymap("n", "<leader>n", ":Lex 15<cr>", opts)

-- Open Nvim-Tree to the left
keymap("n", "<leader>n", ":NvimTreeToggle<CR>", opts)

-- Close Buffer and focus on next
keymap("n", "<leader>d", "<cmd>lua DeleteCurrentBuffer()<cr>", opts)

-- Telescope Maps
keymap("n", "<leader>ff", ":Telescope find_files hidden=true<cr>", opts)
keymap("n", "<leader>fg", ":Telescope live_grep<cr>", opts)
keymap("n", "<leader>fb", ":Telescope buffers<cr>", opts)
keymap("n", "<leader>fh", ":Telescope help_tags<cr>", opts)
keymap("n", "<leader>ft", ":TodoTelescope<cr>", opts)

-- Visual --
-- Stay in indent mode
keymap("v", "<", "<gv", opts)
keymap("v", ">", ">gv", opts)

-- Move text up and down
keymap("v", "<C-k>", ":m .-2<CR>==", opts)
keymap("v", "<C-j>", ":m .+1<CR>==", opts)
keymap("v", "<leader>p", '"_dP', opts)

-- Visual Block --
-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<C-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<C-k>", ":move '<-2<CR>gv-gv", opts)

