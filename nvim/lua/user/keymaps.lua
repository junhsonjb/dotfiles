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

-- Easily toggle fuzzy file search
-- (to exit, we simply exit terminal mode then close the fuzzy file search window)
vim.keymap.set('n', '<C-P>', ":lua require('fzf-lua').files()<CR>", { noremap = true })
vim.keymap.set('t', '<C-P>', "<C-\\><C-n>:close<CR>", { noremap = true })

-- Grep through codebase (starting from directory where vim was opened)
vim.keymap.set('n', '<leader>g', ":lua require('fzf-lua').live_grep()<CR>", { noremap = true })

-- Quickly toggle line blame
vim.keymap.set('n', '<C-B>', ':BlamerToggle<CR>', { noremap = true })

-- Quickly toggle floating terminal
vim.keymap.set('n', '<c-t>', ":lua require('FTerm').toggle()<CR>", { noremap = true })
vim.keymap.set('t', '<C-T>', "<C-\\><C-n>:lua require('FTerm').toggle()<CR>", { noremap = true })

-- Quickly go into Normal mode when in Terminal
vim.keymap.set('t', '<esc><esc>', '<C-\\><C-n>', { noremap = true })

-- Easily scroll buffers
vim.keymap.set('n', '<leader>p', ':bp<CR>', { noremap = true })
vim.keymap.set('n', '<leader>n', ':bn<CR>', { noremap = true })

-- Quickly close buffers
vim.keymap.set('n', '<leader>q', ':Sayonara<CR>', { noremap = true })

-- View LSP errors for file
vim.keymap.set('n', '<leader>x', ':TroubleToggle<CR>', { noremap = true })

-- Open Buffer Manager
-- vim.keymap.set('n', '<leader>b', ':lua require("buffer_manager.ui").toggle_quick_menu()<CR>', { noremap = true })
vim.keymap.set('n', '<leader>b', ':FzfLua buffers<CR>', { noremap = true })
