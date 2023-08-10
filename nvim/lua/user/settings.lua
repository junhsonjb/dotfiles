-- Search down into subfolders
-- Provides tab-completion for all file-related tasks
-- (should figure out what this does and use vim library if possible)
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
vim.opt.textwidth = 100
vim.opt.clipboard = 'unnamed'
vim.opt.mouse = 'nv'
vim.opt.number = true
vim.opt.scrolloff = 8

-- I'll always love you, dracula
-- vim.cmd([[colorscheme dracula]])

vim.cmd.colorscheme 'catppuccin-mocha'

-- vim.api.nvim_set_hl(0, "Comment", { fg = "#03a817", italic = true })

-- TODO: make highlights italic
-- (this "works" but resets all other comment style defaults)
-- (also it DOESN'T work! comments are still not italic!)
-- vim.api.nvim_set_hl(0, 'Comment', { 
--     fg = "gray", -- I don't like this, would rather use colorscheme defaults
--     italic = true,
-- })
