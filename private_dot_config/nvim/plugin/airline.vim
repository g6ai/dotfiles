let g:airline_powerline_fonts = 1
"let g:airline#extensions#tabline#enabled = 1
" Enable next two lines to define straight tabs
"let g:airline#extensions#tabline#left_sep = ' '
"let g:airline#extensions#tabline#left_alt_sep = '|'
"let g:airline#extensions#tabline#formatter = 'unique_tail_improved'
" Insert separator between whitespace warning and coc warning

let g:airline_section_warning = '%{airline#util#prepend(airline#extensions#nvimlsp#get_warning(),0)}%{airline#util#prepend(airline#extensions#whitespace#check(),0)}%{airline#util#wrap(airline#extensions#coc#get_warning(),0)}'

" Workaround for display problem in kitty SSH session
if $TERM == 'xterm-kitty'
  augroup airline_init_kitty
    autocmd!
    autocmd VimEnter * call airline#extensions#tabline#buffers#invalidate()
    autocmd VimEnter * AirlineRefresh
    autocmd VimEnter * redraw!
  augroup END
endif
