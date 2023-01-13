let mapleader = " "

" make switching windows easier
nnoremap <C-j> <C-W>j
nnoremap <C-k> <C-W>k
nnoremap <C-l> <C-W>l
nnoremap <C-h> <C-W>h

" make splitting panes easier
nnoremap <Leader>\ :vsplit<enter>
nnoremap <Leader>- :split<enter>

" quick access to fzf files
nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
nnoremap <Leader>g <cmd>lua require('fzf-lua').grep()<CR><CR>

" quickly toggle blamer
nnoremap <c-B> <cmd>:BlamerToggle<CR>

" quickly toggle floaterm
nnoremap <C-T> :FloatermToggle mini<CR>
tnoremap <C-T> <C-\><C-n>:FloatermToggle<CR>

" easily scroll buffers
nnoremap <Leader>p :bp<CR>
nnoremap <Leader>n :bn<CR>

" quickly close buffers
nnoremap <Leader>q :Sayonara<CR>

" trouble.nvim
nnoremap <Leader>x <cmd>TroubleToggle<CR>

" TODO:
" - add key-mappings for delve breakpoint toggle and test, etc.
