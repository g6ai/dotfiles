if g:flag == "good"
  let g:indent_guides_enable_on_vim_startup = 1
  let g:indent_guides_auto_colors = 0

  if &background == 'dark'
    augroup dark_indent_guides
      autocmd!
      autocmd VimEnter,Colorscheme * :call DarkIndentGuides()
    augroup END
  elseif &background == 'light'
    augroup light_indent_guides
      autocmd!
      autocmd VimEnter,Colorscheme * :call LightIndentGuides()
    augroup END
  endif

  let g:indent_guides_start_level = 1
  let g:indent_guides_color_change_percent = 100
  let g:indent_guides_guide_size = 1

  nmap <silent> <leader>i <Plug>IndentGuidesToggle
endif
