-- Search down into subfolders
-- Provides tab-completion for all file-related tasks
vim.cmd([[set path+=**]])

vim.opt.termguicolors = true
vim.opt.formatoptions = vim.opt.formatoptions + 'ro/'
vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true
vim.opt.autoindent = true
vim.opt.copyindent = true
vim.opt.smartindent = true
-- vim.opt.textwidth = 100 -- testing out when I remove this
vim.opt.clipboard = 'unnamed'
vim.opt.mouse = 'nv'
vim.opt.number = true
vim.opt.scrolloff = 8
vim.opt.laststatus = 3

vim.cmd.colorscheme([[catppuccin-mocha]])

-- Configure cursorline highlighting for the active buffer only
vim.cmd([[autocmd BufEnter,WinEnter * setlocal cursorline]])
vim.cmd([[autocmd BufLeave,WinLeave * setlocal nocursorline]])
