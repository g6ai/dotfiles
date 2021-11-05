if g:flag == "good"
  function! DarkIndentGuides()
    "highlight IndentGuidesOdd  ctermbg=242 guibg=#696969
    "highlight IndentGuidesEven ctermbg=008 guibg=#808080
    " Below are from gruvbox palette
    highlight IndentGuidesOdd  ctermbg=239 guibg=#504945 " bg2
    highlight IndentGuidesEven ctermbg=241 guibg=#665c54 " bg3
  endfunction

  function! LightIndentGuides()
    "highlight IndentGuidesOdd  ctermbg=252 guibg=#d3d3d3
    "highlight IndentGuidesEven ctermbg=250 guibg=#bebebe
    " Below are from gruvbox palette
    highlight IndentGuidesOdd  ctermbg=228 guibg=#f2e5bc " bg0_s
    highlight IndentGuidesEven ctermbg=223 guibg=#ebdbb2 " bg1
  endfunction

  function! DarkColorscheme()
    set background=dark
    colorscheme gruvbox
    let g:airline_theme = "gruvbox"
  endfunction

  function! LightColorscheme()
    set background=light
    colorscheme gruvbox
    let g:airline_theme = "gruvbox"
  endfunction

  " IndentGuides(): Set Indent Guides color
  function! IndentGuides(background)
    if a:background == "dark"
      call DarkIndentGuides()
    elseif a:background == "light"
      call LightIndentGuides()
    endif
  endfunction

  " ToggleBackground(): Toggle color scheme
  function! ToggleBackground()
    if &background == "dark"
      call LightColorscheme()
      call IndentGuides(&background)
    elseif &background == "light"
      call DarkColorscheme()
      call IndentGuides(&background)
    endif
    call airline#extensions#tabline#buffers#invalidate()
    AirlineRefresh
    if has('nvim')
      lua package.loaded['colorizer'] = nil; require('colorizer').setup(...); require('colorizer').attach_to_buffer(0)
    endif
    if has('gui_vimr')
      VimRToggleTools
      VimRToggleTools
    endif
    highlight Comment cterm=italic gui=italic
  endfunction

  nmap tb :call ToggleBackground()<CR>

  " MacBackground(): Set color scheme for macOS
  function! MacBackground()
    if system("defaults read -g AppleInterfaceStyle") =~ "^Dark"
      call DarkColorscheme()
      call IndentGuides(&background)
    else
      call LightColorscheme()
      call IndentGuides(&background)
    endif
    highlight Comment cterm=italic gui=italic
  endfunction

  " MacGUIBackground(): change MacVim gVim color scheme automatically
  function! MacGUIBackground()
    if v:os_appearance == 1
      call DarkColorscheme()
      call IndentGuides(&background)
    else
      call LightColorscheme()
      call IndentGuides(&background)
    endif
    call airline#extensions#tabline#buffers#invalidate()
    AirlineRefresh
    highlight Comment cterm=italic gui=italic
  endfunction

  if g:system_name ==# "Darwin"
    if !has('nvim')
      call MacBackground()
      augroup MacVim_auto_background
        autocmd!
        autocmd OSAppearanceChanged * call MacGUIBackground()
      augroup END
    else
      call MacBackground()
    endif
  endif
endif
