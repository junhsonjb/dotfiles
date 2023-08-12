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

-- For plugin-specific configs, see .config/nvim/lua/plugins/PLUGIN_NAME.lua

return require('packer').startup(function(use)
  -- Packer
  use 'wbthomason/packer.nvim'

  -- Dependencies
  use 'nvim-lua/plenary.nvim'
  use 'kyazdani42/nvim-web-devicons'
  use 'kana/vim-textobj-user' -- also use to create text objects

  -- Git stuff
  use 'lewis6991/gitsigns.nvim'
  use 'tpope/vim-commentary'
  use 'tpope/vim-rhubarb'
  use 'tpope/vim-fugitive'
  use 'ruifm/gitlinker.nvim'

  -- Language Specific
  use 'sebdah/vim-delve' -- golang debugger, delve
  use 'simrat39/rust-tools.nvim'

  -- LSP (Language Server Protocol)
  use 'neovim/nvim-lspconfig'
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
        ts_update()
      end,
    }
  use 'nvim-treesitter/nvim-treesitter-context'

  -- Theme(s)
  use { 'catppuccin/nvim', as = 'catppuccin' } -- what I'm rocking with
  -- use 'Mofiqul/dracula.nvim'
  -- use 'Rigellute/rigel'

  -- Appearance
  use 'fladson/vim-kitty'
  use {'akinsho/bufferline.nvim', tag = "*", requires = 'nvim-tree/nvim-web-devicons'}
  -- use 'feline-nvim/feline.nvim'
  use 'freddiehaddad/feline.nvim'

  -- Quality of life
  use {'ibhagwan/fzf-lua', requires = 'nvim-tree/nvim-web-devicons'}
  use 'numToStr/FTerm.nvim'
  use 'folke/trouble.nvim'
  use 'mhinz/vim-sayonara' -- consider finding/writeing lua alternative 
  use 'github/copilot.vim'

  -- Miscellaneous
  use 'kana/vim-textobj-entire' -- entire file text object
  use 'vim-scripts/loremipsum' -- add lorem ipsum text
  use 'christoomey/vim-tmux-navigator' -- switch between tmux/vim panes/windows

  -- Writing
  use { 'smithbm2316/centerpad.nvim' }
  use { 'kblin/vim-fountain' }

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end)
