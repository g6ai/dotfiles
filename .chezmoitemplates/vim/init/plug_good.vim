" Auto source .vimrc and refresh vim-airline after saving
augroup auto_source_vimrc_refresh_airline
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC | call airline#extensions#tabline#buffers#invalidate() | AirlineRefresh
augroup END

let g:config_files = [
      \ 'misc.vim',
      \ 'cursor.vim',
      \ 'spell.vim',
      \ 'colour.vim',
      \ 'clipboard.vim',
      \ 'buffer.vim',
      \ 'window.vim',
      \ 'python.vim',
      \ 'plug.vim',
      \ 'gruvbox-material.vim',
      \ 'theme.vim',
      \ ]
" Strict loading order: 'plug.vim' -> 'gruvbox.vim' -> 'theme.vim'
