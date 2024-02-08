-- Automatically install lazy.nvim
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

-- Use a protected call so we don't error out on first use
local status_ok, lazy = pcall(require, "lazy")
if not status_ok then
  return
end

-- Install plugins here
local plugins = {
    "folke/lazy.nvim", -- Have lazy manage itself
    "nvim-lua/popup.nvim", -- An implementation of the Popup API from vim in Neovim
    "nvim-lua/plenary.nvim", -- Useful lua functions used ny lots of plugins
    "nvim-lualine/lualine.nvim", -- Status Line for Neovim
    "nvim-tree/nvim-web-devicons",
    "nvim-tree/nvim-tree.lua", -- File Explorer for Neovim
    "airblade/vim-rooter", -- Root to CWD
    "nvim-telescope/telescope.nvim",
    "nvim-telescope/telescope-fzy-native.nvim",
    "kylechui/nvim-surround", -- Add/Edit surrounding pairs
    "tpope/vim-fugitive", -- Vim Git itigrations
    "tpope/vim-rhubarb", -- Vim Git browser
    "tpope/vim-commentary", -- Comment lines with gcc
    "windwp/nvim-autopairs", -- Autopairs, integrates with both cmp and treesitter
    "rcarriga/nvim-notify", -- A fancy, configurable, notification manager for Neovim
    "folke/todo-comments.nvim", -- H ighlight and search for todo comments like TODO, HACK, BUG in your code base
    "SmiteshP/nvim-navic", -- show your current code context
    "lukas-reineke/indent-blankline.nvim", -- Indentation guides
    "akinsho/bufferline.nvim", -- Snazzy Bufferline

    -- Colorschemes
    "sainnhe/gruvbox-material",
    "joshdick/onedark.vim",
    "Mofiqul/dracula.nvim",
    "shaunsingh/nord.nvim",
    { "catppuccin/nvim", name = "catppuccin", priority = 1000 },
    -- Completion plugins
    "hrsh7th/nvim-cmp", -- The completion plugin
    "hrsh7th/cmp-buffer", -- buffer completions
    "hrsh7th/cmp-path", -- path completions
    "hrsh7th/cmp-cmdline", -- cmdline completions
    "saadparwaiz1/cmp_luasnip", -- snippet completions
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-emoji",
    "hrsh7th/cmp-nvim-lua",

    -- Snippets
    "L3MON4D3/LuaSnip", --snippet engine
    "rafamadriz/friendly-snippets", -- a bunch of snippets to use

    -- LSP
    "neovim/nvim-lspconfig", -- enable LSP
    "williamboman/mason.nvim", -- simple to language server installer
    "williamboman/mason-lspconfig.nvim",
    "tamago324/nlsp-settings.nvim", -- language server settings defined in json for
    "jose-elias-alvarez/null-ls.nvim", -- for formatters and linters
    "filipdutescu/renamer.nvim",
    "simrat39/symbols-outline.nvim",
    "ray-x/lsp_signature.nvim",
    "b0o/SchemaStore.nvim",
    { "folke/trouble.nvim", cmd = "TroubleToggle", },
    "RRethy/vim-illuminate",

    -- Treesitter
    {"nvim-treesitter/nvim-treesitter", build = ":TSUpdate"},
    "JoosepAlviste/nvim-ts-context-commentstring",
    "nvim-treesitter/playground",
    "windwp/nvim-ts-autotag",
    "romgrk/nvim-treesitter-context",
}

local opts = {}

require("lazy").setup(plugins, opts)
