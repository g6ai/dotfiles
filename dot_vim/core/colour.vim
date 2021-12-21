syntax enable
colorscheme slate
highlight Normal ctermbg=235
highlight StatusLine ctermfg=253
highlight StatusLineNC ctermfg=243
highlight Tabline ctermbg=239
highlight TablineFill ctermfg=243
highlight VertSplit ctermfg=235 ctermbg=243

" Prevent wrong bg colour during rapid scrolling
if (!has('nvim') && &term =~ '^xterm' && &t_Co == 256)
  set t_ut= | set ttyscroll=1
endif

augroup highlighting_fix
  autocmd!
  " fix vim script user command syntax highlighting
  " (should be unnecessary when https://github.com/vim/vim/issues/6587 is fixed)
  autocmd Syntax vim syn match vimUsrCmd '^\s*\zs\u\%(\w*\)\@>(\@!'
augroup END
