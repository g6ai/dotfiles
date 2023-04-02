function! theme#HighlightBg(group, bg)
  execute 'highlight' a:group 'ctermbg=' . a:bg[1] 'guibg=' . a:bg[0]
endfunction

function! theme#DarkIndentGuides(odd_bg, even_bg)
  call theme#HighlightBg('IndentGuidesOdd', a:odd_bg)
  call theme#HighlightBg('IndentGuidesEven', a:even_bg)
endfunction

function! theme#LightIndentGuides(odd_bg, even_bg)
  call theme#HighlightBg('IndentGuidesOdd', a:odd_bg)
  call theme#HighlightBg('IndentGuidesEven', a:even_bg)
endfunction

function! theme#DarkCoc(bg)
  call theme#HighlightBg('CocFloating', a:bg)
endfunction

function! theme#LightCoc(bg)
  call theme#HighlightBg('CocFloating', a:bg)
endfunction

function! theme#DarkColorscheme()
  set background=dark
  " Using https://github.com/sainnhe/gruvbox-material
  colorscheme gruvbox-material
  let l:dark_bg0=gruvbox_material#get_palette('hard', 'mix', {})['bg0']
  let l:dark_bg3=gruvbox_material#get_palette('hard', 'mix', {})['bg3']
  let l:dark_bg5=gruvbox_material#get_palette('hard', 'mix', {})['bg5']
  "ctermbg=234 guibg=#1d2021 " bg0
  "ctermbg=237 guibg=#3c3836 " bg3=bg4
  "ctermbg=239 guibg=#504945 " bg5
  call theme#DarkIndentGuides(l:dark_bg3, l:dark_bg5)
  call theme#DarkCoc(l:dark_bg0)
endfunction

function! theme#LightColorscheme()
  set background=light
  " Using https://github.com/sainnhe/edge
  colorscheme edge
  let l:light_bg0=edge#get_palette('light', '', {})['bg0']
  let l:light_bg2=edge#get_palette('light', '', {})['bg2']
  let l:light_bg4=edge#get_palette('light', '', {})['bg4']
  "ctermbg=231 guibg=#fafafa " bg0
  "ctermbg=254 guibg=#e8ebf0 " bg2=bg_dim
  "ctermbg=253 guibg=#dde2e7 " bg4=black
  call theme#LightIndentGuides(l:light_bg2, l:light_bg4)
  call theme#LightCoc(l:light_bg0)
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
