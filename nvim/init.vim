" Welcome to my nvim config! It's a work in progress! Make it great!

" Search down into subfolders
" Provides tab-completion for all file-related tasks
set path+=**

" Plugins
call plug#begin()

Plug 'feline-nvim/feline.nvim'
Plug 'lewis6991/gitsigns.nvim'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'ibhagwan/fzf-lua', {'branch': 'main'}
Plug 'sebdah/vim-delve'
Plug 'neovim/nvim-lspconfig'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-rhubarb'
Plug 'kana/vim-textobj-user'
Plug 'kana/vim-textobj-entire'
Plug 'vim-scripts/loremipsum'
Plug 'christoomey/vim-tmux-navigator'
Plug 'tpope/vim-fugitive'
Plug 'APZelos/blamer.nvim'
Plug 'Mofiqul/dracula.nvim'
Plug 'fladson/vim-kitty'
Plug 'voldikss/vim-floaterm'
Plug 'akinsho/bufferline.nvim', { 'tag': 'v3.*' }
Plug 'mhinz/vim-sayonara', { 'on': 'Sayonara' }
Plug 'simrat39/rust-tools.nvim'
Plug 'Rigellute/rigel'
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'folke/trouble.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'j-morano/buffer_manager.nvim'

call plug#end()

" colorscheme koehler
colorscheme dracula
" colorscheme rigel

" settings
" source ~/.config/nvim/settings.vim

" keymaps
" source ~/.config/nvim/keymaps.vim

" require contents of $NVIM_DIR/lua/config (using init.lua file)
lua require('plugins')
lua require('user')

let g:go_def_mode='gopls'
let g:go_info_mode='gopls'
