nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-h> <C-w>h
nnoremap <C-l> <C-w>l
nnoremap <C-q> <C-w>q

function! AdjustWindowHeight(minheight, maxheight)
  exe max([min([line("$"), a:maxheight]), a:minheight]) . "wincmd _"
endfunction

augroup quickfix_window_height
  autocmd!
  autocmd FileType qf call AdjustWindowHeight(1, 3)
augroup END

nnoremap <leader>hc :helpclose<CR>
