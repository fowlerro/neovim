local fn = vim.fn

local packer_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(packer_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    packer_path,
  }
  print "Installing packer"
  vim.cmd [[packadd packer.nvim]]
end

-- Auto reload packer
vim.cmd [[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]]

-- Import packer
local status_ok, packer = pcall(require, "packer")
if not status_ok then return end

-- Packer Popup Window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}


-- Plugins
return packer.startup(function(use)
  -- Core
  use "wbthomason/packer.nvim"

  -- Libraries
  use "nvim-lua/popup.nvim"
  use "nvim-lua/plenary.nvim"

  -- Themes
  use "lunarvim/darkplus.nvim"
  use "lunarvim/onedarker.nvim"

  -- Auto completion
  use "hrsh7th/nvim-cmp"
  use "hrsh7th/cmp-buffer"
  use "hrsh7th/cmp-path"
  use "hrsh7th/cmp-cmdline"
  use "hrsh7th/cmp-nvim-lsp"
  use "saadparwaiz1/cmp_luasnip"

  -- LSP
  use "neovim/nvim-lspconfig"
  use "williamboman/nvim-lsp-installer"
  use "jose-elias-alvarez/null-ls.nvim"

  -- Snippets
  use "L3MON4D3/LuaSnip" -- Snippet Engine
  use "rafamadriz/friendly-snippets"

  -- Files
  use "nvim-telescope/telescope.nvim"
  use "nvim-telescope/telescope-media-files.nvim"

  use "rmagatti/auto-session"

  -- TreeSitter 
  use { "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" }

  -- Misc
  use "windwp/nvim-autopairs"
  use "tpope/vim-commentary"
  use "MaxMEllon/vim-jsx-pretty"
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'lewis6991/gitsigns.nvim'
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use {
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  }

  use "akinsho/bufferline.nvim"
  use "moll/vim-bbye"

  use "windwp/nvim-ts-autotag"


  -- Text Objects
  use "michaeljsmith/vim-indent-object"
  use "tpope/vim-surround"

  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
