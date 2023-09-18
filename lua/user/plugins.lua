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
  use "windwp/nvim-autopairs" -- Autopairs, integrates with both cmp and treesitter
  use "numToStr/Comment.nvim" -- Easily comment stuff
  use "kyazdani42/nvim-web-devicons"
  use "kyazdani42/nvim-tree.lua"
  use {
    "akinsho/bufferline.nvim",
    branch = 'main'
  }
  use "moll/vim-bbye"
  use "nvim-lualine/lualine.nvim"
  use {
    "akinsho/toggleterm.nvim",
    branch = 'main'
  }
  use "ahmedkhalf/project.nvim"
  use "lewis6991/impatient.nvim"
  use "lukas-reineke/indent-blankline.nvim"
  use "goolord/alpha-nvim"
  use "antoinemadec/FixCursorHold.nvim" -- This is needed to fix lsp doc highlight
  use "folke/which-key.nvim"
  use {
    's1n7ax/nvim-window-picker',
    tag = 'v1.5',
  }

  -- Colorschemes
  -- use "lunarvim/colorschemes" -- A bunch of colorschemes you can try out
  use "lunarvim/darkplus.nvim"
  use "norcalli/nvim-colorizer.lua"
  use 'Mofiqul/dracula.nvim'

  -- cmp plugins
  use "hrsh7th/nvim-cmp" -- The completion plugin
  use "hrsh7th/cmp-buffer" -- buffer completions
  use "hrsh7th/cmp-path" -- path completions
  use "hrsh7th/cmp-cmdline" -- cmdline completions
  use "saadparwaiz1/cmp_luasnip" -- snippet completions
  use "hrsh7th/cmp-nvim-lsp"

  -- snippets
  use "L3MON4D3/LuaSnip" --snippet engine
  use "rafamadriz/friendly-snippets" -- a bunch of snippets to use

  -- LSP
  -- use {
  --   "williamboman/mason.nvim",
  --   run = ":MasonUpdate" -- :MasonUpdate updates registry contents
  -- }
  -- use "williamboman/mason-lspconfig.nvim"
  -- use "neovim/nvim-lspconfig" -- enable LSP
  use {
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "neovim/nvim-lspconfig",
  }
  --[[ use "williamboman/nvim-lsp-installer" -- simple to use language server installer ]]
  use "tamago324/nlsp-settings.nvim" -- language server settings defined in json for
  use "jose-elias-alvarez/null-ls.nvim" -- for formatters and linters

  -- Telescope
  use "nvim-telescope/telescope.nvim"

  -- Treesitter
  use {
    "nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }
  use "JoosepAlviste/nvim-ts-context-commentstring"

  -- Git
  use "lewis6991/gitsigns.nvim"
  use "tpope/vim-fugitive"
  use {
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
  }

  -- writing improvements
  use "tpope/vim-surround"
  use "mg979/vim-visual-multi"
  use "bkad/CamelCaseMotion"
  use 'lukoshkin/highlight-whitespace'
  -- use {
    -- 'lukoshkin/trailing-whitespace',
    -- config = function ()
    --   require'trailing-whitespace'.setup {
    --      patterns = { '\\s\\+$', '\\t\\+' },
    --      default_color = 'PaleVioletRed',
    --   }
    -- end
  -- }

  use "ludovicchabant/vim-gutentags"

  -- Orgmode stuff
  use "nvim-orgmode/orgmode"

  -- jinja
  --[[ use "lepture/vim-jinja" ]]
  use "https://gitlab.com/HiPhish/jinja.vim.git"

  -- Python
  use {
    "pappasam/nvim-repl",
    requires = "tpope/vim-repeat",
  }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
