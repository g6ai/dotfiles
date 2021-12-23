" Auto source .vimrc after saving
augroup auto_source_vimrc
  autocmd!
  autocmd BufWritePost $MYVIMRC source $MYVIMRC
augroup END

let g:tex_comment_nospell = 1 " For vimtex use g:vimtex_syntax_nospell_comments

let g:config_files = [
      \ 'misc.vim',
      \ 'cursor.vim',
      \ 'spell.vim',
      \ 'colour.vim',
      \ 'clipboard.vim',
      \ 'buffer.vim',
      \ 'window.vim',
      \ 'python.vim',
      \ ]
