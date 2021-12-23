set spelllang=en_gb
set spellfile=~/.config/nvim/spell/en.utf-8.add

augroup spell_setting
  autocmd!
  autocmd FileType tex setlocal spell
augroup END

augroup spellfiles
  autocmd!
  autocmd BufNewFile,BufRead *.tex setlocal spellfile+=~/.config/nvim/spell/tex.utf-8.add
augroup END
