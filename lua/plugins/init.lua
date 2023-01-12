-- setup packer + plugins
local fn = vim.fn
-- local install_path = fn.stdpath "data" .. "/site/pack/packer/opt/packer.nvim"
local install_path = fn.stdpath ("data") .. "/site/pack/packer/start/packer.nvim"

if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system({ 'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path })
  vim.cmd "packadd packer.nvim"
  vim.cmd "PackerSync"
end

return require('packer').startup(function(use)

  -- My plugins here
  use "wbthomason/packer.nvim" -- Have packer manage itself

  use {
    'windwp/nvim-autopairs',
     config = pcall(require, "plugins.configs.autopairs")
  }
  use {
    "nvim-telescope/telescope.nvim",
    requires = {
      {'nvim-lua/popup.nvim'},
      {'nvim-lua/plenary.nvim'},
      {'nvim-telescope/telescope-fzf-native.nvim', run="make"},
      {'nvim-telescope/telescope-symbols.nvim'},
      { "nvim-telescope/telescope-file-browser.nvim" },
    },
   config = require "plugins.configs.telescope",
  }

  use {
    'nvim-treesitter/nvim-treesitter',
    requires = {
      "windwp/nvim-ts-autotag",
      "p00f/nvim-ts-rainbow",
    },
    run = ':TSUpdate',
   config = pcall(require, "plugins.configs.treesitter")
  }

  use {
    "williamboman/mason.nvim",
    requires = {
      "neovim/nvim-lspconfig",
      "williamboman/mason-lspconfig.nvim",
      "jose-elias-alvarez/typescript.nvim",
    },
   config = pcall(require, "plugins.configs.lsp")
  }

  use { 'ibhagwan/fzf-lua',
    -- optional for icon support
    requires = { 'nvim-tree/nvim-web-devicons' }
  }

  -- UI

  use { "rmehri01/onenord.nvim" }
  use { "goolord/alpha-nvim", config = require "plugins.configs.alpha" }
  use { "nvim-tree/nvim-web-devicons", config = require "plugins.configs.icons" }
  use {
    "nvim-lualine/lualine.nvim",
   config = require "plugins.configs.lualine",
    requires = { "nvim-tree/nvim-web-devicons", opt = true },
  }

  use {
    "hrsh7th/nvim-cmp",
    requires = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lua",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-cmdline",
      "hrsh7th/cmp-nvim-lsp-document-symbol",
      "hrsh7th/cmp-vsnip",
      "hrsh7th/vim-vsnip",
      "hrsh7th/cmp-nvim-lsp-signature-help",
    },
    config = require "plugins.configs.cmp",
  }

  use {
    "L3MON4D3/LuaSnip",
    config = pcall(require, "plugins.configs.luasnip")
  }

  use {"saadparwaiz1/cmp_luasnip"}

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons', -- optional, for file icon
    },
    tag = 'nightly', -- optional, updated every week. (see issue #1193)
   config = pcall(require, "plugins.configs.nvim-tree")
  }

  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
    -- tag = 'release' -- To use the latest release
  }

  use 'tpope/vim-fugitive'
  use 'turbio/bracey.vim'
  use 'sheerun/vim-polyglot'
  use 'alvan/vim-closetag'
  use 'tpope/vim-commentary'
  use 'mattn/emmet-vim'
  use 'christoomey/vim-tmux-navigator'
  use 'terryma/vim-multiple-cursors'

  -- React
  use {'neoclide/coc.nvim', branch = 'release'}
  use {'styled-components/vim-styled-components',  branch = 'main' }
  use 'fleischie/vim-styled-components'

  -- markdown
  use({
      "iamcco/markdown-preview.nvim",
      run = function() vim.fn["mkdp#util#install"]() end,
  })

  use 'github/copilot.vim'

  use {
    'prettier/vim-prettier',
    run = 'yarn install',
    ft = {'javascript', 'typescript', 'css', 'html', 'scss', 'graphql', 'markdown', 'react'}
  }

  use {
    "NTBBloodbath/rest.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = require "plugins.configs.rest"
  }
  
  use 'lewis6991/impatient.nvim'
  use {
    'NvChad/nvterm',
    config = require "plugins.configs.nvterm"
  }

end)
