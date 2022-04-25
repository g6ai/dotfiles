" vim-plug
" Automatic installation
"let data_dir = has('nvim') ? stdpath('data') . '/site' : '~/.vim'
"if empty(glob(data_dir . '/autoload/plug.vim'))
"  silent execute '!curl -fLo '.data_dir.'/autoload/plug.vim --create-dirs  https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim'
"  autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
"endif

" vim-plug conditional activation
function! Cond(cond, ...)
  let opts = get(a:000, 0, {})
  return a:cond ? opts : extend(opts, { 'on': [], 'for': [] })
endfunction

{{ list "call plug#begin('" .rtp "/plugged')" | join "" }}
Plug 'tpope/vim-fugitive' | Plug 'rbong/vim-flog'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sainnhe/gruvbox-material'
Plug 'sainnhe/edge'
Plug 'preservim/nerdtree', { 'on': 'NERDTreeToggle' } | Plug 'Xuyuanp/nerdtree-git-plugin', { 'on': 'NERDTreeToggle' }
Plug 'edkolev/tmuxline.vim' " See tmuxline.vim settings section
Plug 'lervag/vimtex'
Plug 'godlygeek/tabular' " tabular plugin must come before vim-markdown
Plug 'plasticboy/vim-markdown' | Plug 'JamshedVesuna/vim-markdown-preview', { 'for': 'markdown' }
Plug 'SirVer/ultisnips' | Plug 'honza/vim-snippets'
Plug 'psliwka/vim-smoothie'
Plug 'kkoomen/vim-doge', { 'do': { -> doge#install() } }
Plug 'ryanoasis/vim-devicons'
Plug 'rhysd/committia.vim'
Plug 'dstein64/vim-startuptime'
Plug 'Raimondi/delimitMate'
Plug 'machakann/vim-sandwich'
Plug 'jdhao/better-escape.vim'
{{ if eq .rtp "~/.vim" -}}
" Vim-specific:
Plug 'Yggdroot/LeaderF', { 'do': ':LeaderfInstallCExtension' } | Plug 'skywind3000/Leaderf-snippet'
Plug 'gelguy/wilder.nvim'
{{ else if eq .rtp "~/.config/nvim" -}}
" Neovim-specific:
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'norcalli/nvim-colorizer.lua'
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-treesitter/nvim-treesitter', { 'do': ':TSUpdate' }
Plug 'kyazdani42/nvim-web-devicons'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-lualine/lualine.nvim'
Plug 'kevinhwang91/nvim-hlslens'
Plug 'kevinhwang91/nvim-bqf'
Plug 'kevinhwang91/nvim-fFHighlight'
function! UpdateRemotePlugins(...)
  " Needed to refresh runtime files
  let &rtp=&rtp
  UpdateRemotePlugins
endfunction
Plug 'gelguy/wilder.nvim', { 'do': function('UpdateRemotePlugins') }
{{ end -}}
call plug#end()

" These options won't work in plugin dir
let g:UltiSnipsEnableSnipMate = 0
