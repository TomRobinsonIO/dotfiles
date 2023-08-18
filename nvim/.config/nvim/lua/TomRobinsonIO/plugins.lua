local fn = vim.fn

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Use a protected call so we don't error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

-- Install your plugins here
return packer.startup(function(use)
    -- My plugins here
    use "wbthomason/packer.nvim" -- Have packer manage itself
    use "nvim-lua/popup.nvim" -- An implementation of the Popup API from vim in Neovim
    use "nvim-lua/plenary.nvim" -- Useful lua functions used ny lots of plugins
    use "nvim-lualine/lualine.nvim" -- Status Line for Neovim
    use "nvim-tree/nvim-web-devicons"
    use "nvim-tree/nvim-tree.lua" -- File Explorer for Neovim
    use "airblade/vim-rooter" -- Root to CWD
    use "nvim-telescope/telescope.nvim"
    use "nvim-telescope/telescope-fzy-native.nvim"
    use "kylechui/nvim-surround" -- Add/Edit surrounding pairs
    use "tpope/vim-fugitive" -- Vim Git itigrations
    use "tpope/vim-rhubarb" -- Vim Git browser
    use "tpope/vim-commentary" -- Comment lines with gcc
    use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
    use "rcarriga/nvim-notify" -- A fancy, configurable, notification manager for Neovim
    use "folke/todo-comments.nvim" -- H ighlight and search for todo comments like TODO, HACK, BUG in your code base
    use  "SmiteshP/nvim-navic" -- show your current code context
    use "lukas-reineke/indent-blankline.nvim" -- Indentation guides
    use 'akinsho/bufferline.nvim' -- Snazzy Bufferline

    -- Colorschemes
    use "sainnhe/gruvbox-material"
    use "joshdick/onedark.vim"
    use "Mofiqul/dracula.nvim"
    use "shaunsingh/nord.nvim"
    use {"catppuccin/nvim", as = "catppuccin" }

    -- cmp plugins
    use "hrsh7th/nvim-cmp" -- The completion plugin
    use "hrsh7th/cmp-buffer" -- buffer completions
    use "hrsh7th/cmp-path" -- path completions
    use "hrsh7th/cmp-cmdline" -- cmdline completions
    use "saadparwaiz1/cmp_luasnip" -- snippet completions
    use "hrsh7th/cmp-nvim-lsp"
    use "hrsh7th/cmp-emoji"
    use "hrsh7th/cmp-nvim-lua"

      -- snippets
    use "L3MON4D3/LuaSnip" --snippet engine
    use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

    -- LSP
    use "neovim/nvim-lspconfig" -- enable LSP
    use "williamboman/mason.nvim" -- simple to use language server installer
    use "williamboman/mason-lspconfig.nvim"
    use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
    use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters
    use "filipdutescu/renamer.nvim"
    use "simrat39/symbols-outline.nvim"
    use "ray-x/lsp_signature.nvim"
    use "b0o/SchemaStore.nvim"
    use {
    "folke/trouble.nvim",
    cmd = "TroubleToggle",
    }
    use "RRethy/vim-illuminate"

    -- Treesitter
    use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    }
    use "JoosepAlviste/nvim-ts-context-commentstring"
    use "nvim-treesitter/playground"
    use "windwp/nvim-ts-autotag"
    use "romgrk/nvim-treesitter-context"

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
