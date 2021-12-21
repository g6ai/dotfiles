set spelllang=en_gb
set spellfile=~/.vim/spell/en.utf-8.add

augroup spell_setting
  autocmd!
  autocmd FileType tex setlocal spell
augroup END

augroup spellfiles
  autocmd!
  autocmd BufNewFile,BufRead *.tex setlocal spellfile+=~/.vim/spell/tex.utf-8.add
augroup END
