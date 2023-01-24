-- [SPACE] key as leader
vim.g.mapleader = ' '

-- Make pane switching easier
vim.keymap.set('n', '<C-j>', '<C-W>j', { noremap = true })
vim.keymap.set('n', '<C-k>', '<C-W>k', { noremap = true })
vim.keymap.set('n', '<C-l>', '<C-W>l', { noremap = true })
vim.keymap.set('n', '<C-h>', '<C-W>h', { noremap = true })

-- Make splitting panes easier
vim.keymap.set('n', '<leader>\\', ':vsplit<CR>', { noremap = true })
vim.keymap.set('n', '<leader>-', ':split<CR>', { noremap = true })

-- Quick access to fzf
vim.keymap.set('n', '<C-P>', ":lua require('fzf-lua').files()<CR>", { noremap = true })
vim.keymap.set('n', '<leader>g', ":lua require('fzf-lua').grep()<CR><CR>", { noremap = true })

-- Quickly toggle line blame
vim.keymap.set('n', '<C-B>', ':BlamerToggle<CR>', { noremap = true })

-- Quickly toggle floaterm
vim.keymap.set('n', '<C-T>', ':FloatermToggle mini<CR>', { noremap = true })
vim.keymap.set('t', '<C-T>', '<C-\\><C-n>:FloatermToggle<CR>', { noremap = true })

-- Easily scroll buffers
vim.keymap.set('n', '<leader>p', ':bp<CR>', { noremap = true })
vim.keymap.set('n', '<leader>n', ':bn<CR>', { noremap = true })

-- Quickly close buffers
vim.keymap.set('n', '<leader>q', ':Sayonara<CR>', { noremap = true })

-- View LSP errors for file
vim.keymap.set('n', '<leader>x', ':TroubleToggle<CR>', { noremap = true })
