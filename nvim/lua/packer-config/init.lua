local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

return require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  use 'nvim-lua/plenary.nvim'
  use 'feline-nvim/feline.nvim'
  use 'lewis6991/gitsigns.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use { "ibhagwan/fzf-lua",
    -- optional for icon support
    requires = { "nvim-tree/nvim-web-devicons" }
  }
  use 'sebdah/vim-delve'
  use 'neovim/nvim-lspconfig'
  use 'tpope/vim-commentary'
  use 'tpope/vim-rhubarb'
  use 'kana/vim-textobj-user'
  use 'kana/vim-textobj-entire'
  use 'vim-scripts/loremipsum'
  use 'christoomey/vim-tmux-navigator'
  use 'tpope/vim-fugitive'
  use 'APZelos/blamer.nvim'
  use 'Mofiqul/dracula.nvim'
  use 'fladson/vim-kitty'
  use 'voldikss/vim-floaterm'
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  use 'mhinz/vim-sayonara'
  use 'simrat39/rust-tools.nvim'
  use 'Rigellute/rigel'
  use {
    'nvim-treesitter/nvim-treesitter',
     run = function()
	local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
	ts_update()
     end,
  }
  use 'folke/trouble.nvim'
  use 'j-morano/buffer_manager.nvim'
  use 'ruifm/gitlinker.nvim'
  use 'numToStr/FTerm.nvim'
  use { "catppuccin/nvim", as = "catppuccin" }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
