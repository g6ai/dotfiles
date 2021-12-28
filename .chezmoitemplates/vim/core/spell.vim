set spelllang=en_gb
{{ list "set spellfile=" .rtp "/spell/en.utf-8.add" | join ""}}

augroup spell_setting
  autocmd!
  autocmd FileType tex setlocal spell
augroup END

augroup spellfiles
  autocmd!
{{ list "  autocmd BufNewFile,BufRead *.tex setlocal spellfile+=" .rtp "/spell/tex.utf-8.add" | join "" }}
augroup END
