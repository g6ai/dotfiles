let NERDTreeShowHidden = 1
let NERDTreeMinimalUI = 1

command! NT NERDTreeToggle
"command! NT NERDTreeToggle | AirlineRefresh
nmap <leader>nt :NT<CR>

augroup NERDTree_buffer_refresh
  autocmd!
  autocmd BufEnter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
  " If more than one window and previous buffer was NERDTree, go back to it.
  autocmd BufEnter * if bufname('#') =~# "^NERD_tree_" && winnr('$') > 1 | b# | endif
  let g:plug_window = 'noautocmd vertical topleft new'
augroup END
