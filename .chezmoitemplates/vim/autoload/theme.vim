function! theme#DarkIndentGuides()
  " Using https://github.com/sainnhe/gruvbox-material
  " mix hard dark
  highlight IndentGuidesOdd  ctermbg=239 guibg=#3c3836 " bg3=bg4
  highlight IndentGuidesEven ctermbg=241 guibg=#504945 " bg5
endfunction

function! theme#LightIndentGuides()
  " Using https://github.com/sainnhe/edge
  " light
  highlight IndentGuidesOdd  ctermbg=252 guibg=#e8ebf0 " bg2=bg3=bg_dim
  highlight IndentGuidesEven ctermbg=250 guibg=#dde2e7 " bg4=black
endfunction

function! theme#DarkColorscheme()
  set background=dark
  colorscheme gruvbox-material
  call theme#DarkIndentGuides()
endfunction

function! theme#LightColorscheme()
  set background=light
  colorscheme edge
  call theme#LightIndentGuides()
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
    call theme#LightColorscheme()
  elseif &background == "light"
    call theme#DarkColorscheme()
  endif
  if has('nvim')
    lua package.loaded['colorizer'] = nil; require('colorizer').setup(...); require('colorizer').attach_to_buffer(0)
  endif
  if has('gui_vimr')
    VimRToggleTools
    VimRToggleTools
  endif
  "highlight Comment cterm=italic gui=italic
endfunction

" MacBackground(): Set colour scheme for macOS
function! theme#MacBackground()
  if system("defaults read -g AppleInterfaceStyle") =~ "^Dark"
    call theme#DarkColorscheme()
  else
    call theme#LightColorscheme()
  endif
  if has('nvim')
    lua package.loaded['colorizer'] = nil; require('colorizer').setup(...); require('colorizer').attach_to_buffer(0)
  endif
  if has('gui_vimr')
    VimRToggleTools
    VimRToggleTools
  endif
  "highlight Comment cterm=italic gui=italic
endfunction

" MacGUIBackground(): change MacVim gVim colour scheme automatically
function! theme#MacGUIBackground()
  if v:os_appearance == 1
    call theme#DarkColorscheme()
  else
    call theme#LightColorscheme()
  endif
  "highlight Comment cterm=italic gui=italic
endfunction
