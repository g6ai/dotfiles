" Split new window below and right
set splitbelow splitright

" Always show status line
set laststatus=2

" Enable a menu at the bottom with tab-key completion
set wildmenu

" Show tabline
"set showtabline=2

" Show current cursor position
set ruler

" Switch on numbering
set nu
" Relative numbering
set rnu
"nnoremap <C-n> :set rnu!<CR>

" Encoding
set encoding=utf-8 " Necessary for Windows to display vim-airline properly
set fileencodings=ucs-bom,utf-8,utf-16,gbk,big5,gb18030,latin1

" Highlight search result
set hlsearch

" See cursor move when typing
set incsearch

" Enable use of mouse for all modes
set mouse=a

" Wrap lines at characters in 'breakat'
set linebreak

" Show last line in the window rather than '@'
set display+=lastline

" Avoid E363
set maxmempattern=2000000

" Use visualbell instead of beep sound, also avoid change in tmuxline
set noeb vb t_vb=

" 'timeout'
set timeoutlen=500
set ttimeout
set ttimeoutlen=100

" Indentation and tab
filetype indent on
set expandtab " Always use space instead of tab

if $TERM_PROGRAM !=# 'Apple_Terminal'
  set termguicolors " For colorizer.lua
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
endif

if has('nvim')
  set shortmess+=S
  set inccommand=nosplit " See :substitute command change the document live
else
  set ttymouse=sgr " For Alacritty terminfo
endif

" Line number from 0 shortcuts. NE: ein; NA: aus
command! NE set nonumber | %s/^/\=line('.')-1."\t"/ | noh
command! NA %s/^[^\t]*\t// | set number | noh
