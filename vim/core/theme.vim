if g:flag == "good"
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
  else
    call theme#Colorscheme(&background)
  endif
  nmap tb :call theme#ToggleBackground()<CR>
endif
