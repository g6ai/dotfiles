if g:flag == "good"
  function! theme#DarkIndentGuides()
    "highlight IndentGuidesOdd  ctermbg=242 guibg=#696969
    "highlight IndentGuidesEven ctermbg=008 guibg=#808080
    " Below are from gruvbox palette
    highlight IndentGuidesOdd  ctermbg=239 guibg=#504945 " bg2
    highlight IndentGuidesEven ctermbg=241 guibg=#665c54 " bg3
  endfunction

  function! theme#LightIndentGuides()
    "highlight IndentGuidesOdd  ctermbg=252 guibg=#d3d3d3
    "highlight IndentGuidesEven ctermbg=250 guibg=#bebebe
    " Below are from gruvbox palette
    highlight IndentGuidesOdd  ctermbg=228 guibg=#f2e5bc " bg0_s
    highlight IndentGuidesEven ctermbg=223 guibg=#ebdbb2 " bg1
  endfunction

  function! theme#DarkColorscheme()
    set background=dark
    colorscheme gruvbox
    call theme#DarkIndentGuides()
    let g:airline_theme = "gruvbox"
  endfunction

  function! theme#LightColorscheme()
    set background=light
    colorscheme gruvbox
    call theme#LightIndentGuides()
    let g:airline_theme = "gruvbox"
  endfunction

  function! theme#Colorscheme(background)
    if a:background == "dark"
      call theme#DarkColorscheme()
    elseif a:background == "light"
      call theme#LightColorscheme()
    endif
  endfunction

  " ToggleBackground(): Toggle colour scheme
  function! theme#ToggleBackground()
    if &background == "dark"
      call theme#Colorscheme("light")
    elseif &background == "light"
      call theme#Colorscheme("dark")
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

  " MacBackground(): Set colour scheme for macOS
  function! theme#MacBackground()
    if system("defaults read -g AppleInterfaceStyle") =~ "^Dark"
      call theme#Colorscheme("dark")
    else
      call theme#Colorscheme("light")
    endif
    highlight Comment cterm=italic gui=italic
  endfunction

  " MacGUIBackground(): change MacVim gVim colour scheme automatically
  function! theme#MacGUIBackground()
    if v:os_appearance == 1
      call theme#Colorscheme("dark")
    else
      call theme#Colorscheme("light")
    endif
    call airline#extensions#tabline#buffers#invalidate()
    AirlineRefresh
    highlight Comment cterm=italic gui=italic
  endfunction
endif
