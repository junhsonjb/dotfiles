let mapleader = " "

" make switching windows easier
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" make splitting panes easier
nnoremap <Leader>v :vsplit<enter>
nnoremap <Leader>s :split<enter>

" quick access to fzf files
nnoremap <c-P> <cmd>lua require('fzf-lua').files()<CR>
nnoremap <Leader>g <cmd>lua require('fzf-lua').grep()<CR><CR>

" quickly toggle blamer
nnoremap <c-B> <cmd>:BlamerToggle<CR>

" quickly toggle floaterm
nnoremap <Leader>t :FloatermToggle mini<CR>
tnoremap <Leader>t <C-\><C-n>:FloatermToggle<CR>

" easily scroll buffers
nnoremap <Leader>- :bp<CR>
nnoremap <Leader>= :bn<CR>

" quickly close buffers
nnoremap <Leader>q :Sayonara<CR>

" TODO:
" - add key-mappings for delve breakpoint toggle and test, etc.
