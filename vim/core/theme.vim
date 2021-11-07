if g:flag == "good"
  "colorscheme gruvbox

  if g:system_name ==# "Darwin"
    if !has('nvim')
      call theme#MacBackground()
      augroup MacVim_auto_background
        autocmd!
        autocmd OSAppearanceChanged * call theme#MacGUIBackground()
      augroup END
    else
      call theme#MacBackground()
    endif
  endif
endif
